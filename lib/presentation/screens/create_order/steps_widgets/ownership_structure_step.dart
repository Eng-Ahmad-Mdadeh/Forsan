import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/widgets/custom_drop_down_widget.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
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
        if (title.isNotEmpty) ...[
          Row(
            children: [
              Icon(
                section.id == 'partners-list'
                    ? Iconsax.user_bold
                    : Icons.key_outlined,
                size: AppSize.s16,
                color: AppColors.secondary,
              ),
              SizedBox(width: AppWidth.w4),
              Expanded(
                child: SectionTitle(
                  text: title,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h8),
        ],
        if (description.isNotEmpty) ...[
          BodyTitle(
            text: description,
            color: AppColors.secondaryText,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
            maxLines: 3,
          ),
          SizedBox(height: AppHeight.h8),
        ],
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
    return (condition!.visibleIfIn ?? const <String>[])
        .contains(selectedValues[condition.field]);
  }

  Widget _buildField(BuildContext context, SectionField field) {
    switch (field.type) {
      case 'select':
        return _dropdown(
          context,
          label: field.label,
          placeholder: field.placeholder,
          options: field.options ?? const <FluffyOption>[],
          value: selectedValues[field.id],
          onChanged: (value) {
            if (field.id != null) onFieldChanged(field.id!, value);
          },
        );
      case 'repeater':
        return _buildRepeater(context, field);
      case 'info':
        return _buildInfo(field.label?.trim() ?? '');
      default:
        return CustomInputField(
          key: ValueKey(field.id),
          title: field.label?.trim(),
          hintText: field.placeholder?.trim() ?? '',
          initialValue: selectedValues[field.id]?.toString(),
          req: field.required ?? false,
          fontSize: AppFontSize.s16,
          textInputType: field.type == 'number'
              ? TextInputType.number
              : TextInputType.text,
          backgroundColor: AppColors.white,
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
      return _dropdown(
        context,
        label: field.label,
        placeholder: field.placeholder,
        options: (field.options ?? const <PurpleOption>[])
            .map((option) => _Option(option.label, option.value))
            .toList(),
        value: entry[field.id],
        onChanged: update,
      );
    }
    return CustomInputField(
      key: ValueKey('$repeaterId-$index-${field.id}'),
      title: field.label?.trim(),
      hintText: field.placeholder?.trim() ?? '',
      initialValue: entry[field.id]?.toString(),
      req: field.required ?? false,
      fontSize: AppFontSize.s16,
      textInputType: field.type == 'number' ? TextInputType.number : TextInputType.text,
      backgroundColor: AppColors.white,
      onChanged: update,
    );
  }

  Widget _dropdown(
    BuildContext context, {
    required String? label,
    required String? placeholder,
    required List<dynamic> options,
    required dynamic value,
    required ValueChanged<dynamic> onChanged,
  }) {
    String optionLabel(dynamic option) => option is FluffyOption
        ? option.label?.trim() ?? ''
        : (option as _Option).label?.trim() ?? '';
    dynamic optionValue(dynamic option) =>
        option is FluffyOption ? option.value : (option as _Option).value;
    final items = options.map(optionLabel).where((item) => item.isNotEmpty).toList();
    final selected = options.where((option) => optionValue(option) == value);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BodyTitle(
          text: label?.trim() ?? '',
          textAlign: TextAlign.start,
          color: AppColors.mainText,
          fontSize: AppFontSize.s14,
          fontWeight: AppFontWeight.medium,
        ),
        SizedBox(height: AppHeight.h4),
        CustomDropDownWidget(
          items: items,
          isStringList: true,
          initialItem: selected.isEmpty ? null : optionLabel(selected.first),
          hintText: placeholder?.trim().isNotEmpty == true
              ? placeholder!.trim()
              : context.loc.new_order_select_hint,
          color: AppColors.white,
          height: AppHeight.h50,
          borderRadius: AppRadius.r7,
          closedBorder: const Border.fromBorderSide(
            BorderSide(color: AppColors.greyDivider, width: .7),
          ),
          onChanged: (selectedLabel) {
            final match = options.where((option) => optionLabel(option) == selectedLabel);
            if (match.isNotEmpty) onChanged(optionValue(match.first));
          },
        ),
      ],
    );
  }

  Widget _buildInfo(String text) => SectionCard(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddingWidth.p12,
          vertical: AppPaddingHeight.p10,
        ),
        borderRadius: BorderRadius.circular(AppRadius.r7),
        backgroundColor: AppColors.light,
        child: Row(
          children: [
            Icon(Icons.info_outline_rounded, color: AppColors.primaryDark, size: AppSize.s20),
            SizedBox(width: AppWidth.w8),
            Expanded(
              child: BodyTitle(
                text: text,
                color: AppColors.secondaryText,
                fontSize: AppFontSize.s12,
                fontWeight: AppFontWeight.regular,
                textAlign: TextAlign.start,
                maxLines: 3,
              ),
            ),
          ],
        ),
      );
}

class _Option {
  const _Option(this.label, this.value);
  final String? label;
  final String? value;
}
