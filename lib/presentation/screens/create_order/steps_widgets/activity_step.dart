import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_form_dropdown.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_form_input_field.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_section_header.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class ActivityStep extends StatelessWidget {
  const ActivityStep({
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
        AppPaddingHeight.p100,
      ),
      itemCount: sections.length,
      separatorBuilder: (_, _) => SizedBox(height: AppHeight.h24),
      itemBuilder: (_, index) => _buildSection(sections[index]),
    );
  }

  Widget _buildSection(Section section) {
    final title = section.title?.trim() ?? '';
    final description = section.description?.trim() ?? '';
    final fields = section.fields ?? const <SectionField>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OrderSectionHeader(
          icon: Iconsax.activity_outline,
          title: title,
          description: description,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: fields.length,
          separatorBuilder: (_, _) => SizedBox(height: AppHeight.h8),
          itemBuilder: (_, index) => _buildField(fields[index]),
        ),
      ],
    );
  }

  Widget _buildField(SectionField field) {
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
        return _buildRepeater(field);
      default:
        return OrderFormInputField(
          key: ValueKey(field.id),
          type: field.type,
          label: field.label,
          hint: field.placeholder,
          isRequired: field.required ?? false,
          value: selectedValues[field.id],
          maxLength: field.validation?.max,
          onChanged: (value) {
            if (field.id != null) onFieldChanged(field.id!, value);
          },
        );
    }
  }

  Widget _buildRepeater(SectionField field) {
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
          _buildSubActivityCard(field, entries, index),
          SizedBox(height: AppHeight.h8),
        ],
        if (entries.length < maxItems)
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppPaddingHeight.p8),
            child: CustomElevatedButton(
              key: const Key('new_order_add_sub_activity'),
              width: double.infinity,
              height: AppHeight.h50,
              borderSide: BorderSide(color: AppColors.goldBackGround),
              color: const Color(0xFF0D3D35).withOpacity(0.10),
              borderRadius: AppRadius.r10,
              onPressed: () => onFieldChanged(
                fieldId,
                [...entries, <String, dynamic>{}],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: AppColors.primaryDark, size: AppSize.s16),
                  SizedBox(width: AppWidth.w4),
                  Flexible(
                    child: SectionTitle(
                      text: field.placeholder?.trim() ?? '',
                      color: AppColors.primaryDark,
                      fontSize: AppFontSize.s14,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSubActivityCard(
    SectionField repeater,
    List<Map<String, dynamic>> entries,
    int index,
  ) {
    final entry = entries[index];
    final fields = repeater.fields ?? const <FieldField>[];
    final title = fields.isEmpty ? '' : fields.first.label?.trim() ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: BodyTitle(
                text: title,
                color: AppColors.mainText,
                fontSize: AppFontSize.s14,
                fontWeight: AppFontWeight.medium,
              ),
            ),
            SizedBox(
              width: AppWidth.w24,
              height: AppHeight.h24,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  final updated = [...entries]..removeAt(index);
                  onFieldChanged(repeater.id!, updated);
                },
                icon: Icon(
                  Icons.delete_outline_rounded,
                  color: AppColors.red,
                  size: AppSize.s20,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppHeight.h4),
        for (var fieldIndex = 0; fieldIndex < fields.length; fieldIndex++) ...[
          _buildRepeatedField(
            repeater.id!,
            fields[fieldIndex],
            entries,
            index,
            entry,
            showLabel: fieldIndex > 0,
          ),
          if (fieldIndex < fields.length - 1) SizedBox(height: AppHeight.h8),
        ],
      ],
    );
  }

  Widget _buildRepeatedField(
    String repeaterId,
    FieldField field,
    List<Map<String, dynamic>> entries,
    int index,
    Map<String, dynamic> entry, {
    required bool showLabel,
  }) {
    void update(dynamic value) {
      if (field.id == null) return;
      final updated = entries.map((item) => Map<String, dynamic>.from(item)).toList();
      updated[index][field.id!] = value;
      onFieldChanged(repeaterId, updated);
    }


    return OrderFormInputField(
      key: ValueKey('$repeaterId-$index-${field.id}'),
      type: field.type,
      label: showLabel ? field.label : null,
      hint: field.placeholder,
      isRequired: field.required ?? false,
      value: entry[field.id],
      maxLength:
          field.validation?.max ?? (field.type == 'textarea' ? 100 : null),
      onChanged: update,
    );
  }

}
