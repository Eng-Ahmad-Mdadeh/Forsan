import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_form_dropdown.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_form_input_field.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_info_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_section_header.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class OwnershipStructureStep extends StatelessWidget {
  const OwnershipStructureStep({
    super.key,
    required this.step,
    required this.selectedValues,
    required this.onFieldChanged,
  });

  final StepModel step;
  final Map<String, dynamic> selectedValues;
  final void Function(String fieldId, dynamic value) onFieldChanged;

  @override
  Widget build(BuildContext context) {
    final sections = step.sections ?? const <Section>[];
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(
        AppPaddingWidth.p16,
        AppPaddingHeight.p8,
        AppPaddingWidth.p16,
        AppPaddingHeight.p24,
      ),
      itemCount: sections.length,
      separatorBuilder: (_, _) => SizedBox(height: AppHeight.h24),
      itemBuilder: (_, index) => _buildSection(context, sections[index]),
    );
  }

  Widget _buildSection(BuildContext context, Section section) {
    final fields = (section.fields ?? const <SectionField>[])
        .where(_isVisible)
        .toList(growable: false);
    final title = section.title?.trim() ?? '';
    final description = section.description?.trim() ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OrderSectionHeader(
          icon: section.id == 'partners-list'
              ? Iconsax.user_bold
              : Icons.key_outlined,
          title: title,
          description: description,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: fields.length,
          separatorBuilder: (_, _) => SizedBox(height: AppHeight.h8),
          itemBuilder: (_, index) => _buildField(context, fields[index]),
        ),
      ],
    );
  }

  bool _isVisible(SectionField field) {
    final condition = field.visibleIf;
    if (condition?.field == null) return true;

    // Keep the repeater's add action available before the controlling select
    // has a value. Once a value is selected, follow the backend visibility
    // rule (for example, selecting a one-person company hides partner fields).
    final controllingValue = selectedValues[condition!.field];
    if (field.type == 'repeater' && controllingValue == null) return true;

    return (condition.visibleIfIn ?? const <String>[])
        .contains(controllingValue);
  }

  Widget _buildField(BuildContext context, SectionField field) {
    switch (field.type) {
      case 'select':
        return OrderFormDropdown<dynamic>(
          label: field.label,
          hint: field.placeholder,
          options: (field.options ?? const <FluffyOption>[])
              .map((option) => OrderDropdownOption(
                    label: option.label?.trim() ?? '',
                    value: option.value,
                  ))
              .toList(),
          value: selectedValues[field.id],
          onChanged: (value) {
            if (field.id != null) onFieldChanged(field.id!, value);
          },
        );
      case 'repeater':
        return _buildRepeater(context, field);
      case 'info':
        return OrderInfoCard(
          text: field.label?.trim() ?? '',
          backgroundColor: AppColors.goldBackGround,
          textColor: AppColors.mainText,
          iconColor: AppColors.mainText,
        );
      default:
        return OrderFormInputField(
          key: ValueKey(field.id),
          type: field.type,
          label: field.label,
          hint: field.placeholder,
          value: selectedValues[field.id],
          isRequired: field.required ?? false,
          onChanged: (value) {
            if (field.id != null) onFieldChanged(field.id!, value);
          },
        );
    }
  }

  Widget _buildRepeater(BuildContext context, SectionField field) {
    final fieldId = field.id;
    if (fieldId == null) return const SizedBox.shrink();
    final entries = (selectedValues[fieldId] as List?)
            ?.map((entry) => Map<String, dynamic>.from(entry as Map))
            .toList() ??
        <Map<String, dynamic>>[];
    final maxItems = field.validation?.maxItems ?? 10;

    return Column(
      children: [
        for (var index = 0; index < entries.length; index++) ...[
          _buildPartnerCard(context, field, entries, index),
          SizedBox(height: AppHeight.h8),
        ],
        if (entries.length < maxItems)
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppPaddingHeight.p8),
            child: CustomElevatedButton(
              key: const Key('new_order_add_partner'),
              width: double.infinity,
              height: AppHeight.h50,
              borderSide: BorderSide(color: AppColors.goldBackGround),
              color: const Color(0xFF0D3D35).withOpacity(0.10),
              borderRadius: AppRadius.r10,
              onPressed: () => onFieldChanged(fieldId, [...entries, <String, dynamic>{}]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: AppColors.primaryDark, size: AppSize.s16),
                  SizedBox(width: AppWidth.w4),
                  SectionTitle(
                    text: field.placeholder?.trim().isNotEmpty == true
                        ? field.placeholder!.trim()
                        : context.loc.new_order_add_partner,
                    color: AppColors.primaryDark,
                    fontSize: AppFontSize.s14,
                    fontWeight: AppFontWeight.regular,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPartnerCard(
    BuildContext context,
    SectionField repeater,
    List<Map<String, dynamic>> entries,
    int index,
  ) {
    final entry = entries[index];
    return SectionCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.all(AppPaddingWidth.p16),
      borderRadius: BorderRadius.circular(AppRadius.r8),
      backgroundColor: AppColors.goldBackGround.withOpacity(0.4),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: IconButton(
              onPressed: () {
                final updated = [...entries]..removeAt(index);
                onFieldChanged(repeater.id!, updated);
              },
              icon: Icon(Icons.delete_outline, color: Colors.redAccent, size: AppSize.s24),
            ),
          ),
          for (final field in repeater.fields ?? const <FieldField>[]) ...[
            _buildRepeatedField(context, repeater.id!, field, entries, index, entry),
            SizedBox(height: AppHeight.h8),
          ],
        ],
      ),
    );
  }

  Widget _buildRepeatedField(
    BuildContext context,
    String repeaterId,
    FieldField field,
    List<Map<String, dynamic>> entries,
    int index,
    Map<String, dynamic> entry,
  ) {
    void update(dynamic value) {
      final updated = entries.map((item) => Map<String, dynamic>.from(item)).toList();
      updated[index][field.id!] = value;
      onFieldChanged(repeaterId, updated);
    }

    if (field.type == 'select') {
      return OrderFormDropdown<dynamic>(
        label: field.label,
        hint: field.placeholder,
        options: (field.options ?? const <PurpleOption>[])
            .map((option) => OrderDropdownOption(
                  label: option.label?.trim() ?? '',
                  value: option.value,
                ))
            .toList(),
        value: entry[field.id],
        onChanged: update,
      );
    }
    return OrderFormInputField(
      key: ValueKey('$repeaterId-$index-${field.id}'),
      type: field.type,
      label: field.label,
      hint: field.placeholder,
      value: entry[field.id],
      isRequired: field.required ?? false,
      onChanged: update,
    );
  }

}
