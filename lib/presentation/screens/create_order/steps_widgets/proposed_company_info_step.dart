import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_form_dropdown.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_form_input_field.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_info_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_section_header.dart';
import 'package:icons_plus/icons_plus.dart';

class ProposedCompanyInfoStep extends StatelessWidget {
  final StepModel step;
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic> selectedValues;
  final void Function(String fieldId, dynamic value) onFieldChanged;

  const ProposedCompanyInfoStep({
    super.key,
    required this.formKey,
    required this.step,
    required this.selectedValues,
    required this.onFieldChanged,
  });

  @override
  Widget build(BuildContext context) {
    final sections = step.sections ?? const <Section>[];

    return Form(
      key: formKey,
      child: ListView.separated(
      padding: EdgeInsets.fromLTRB(
        AppPaddingWidth.p16,
        AppPaddingHeight.p8,
        AppPaddingWidth.p16,
        AppPaddingHeight.p24,
      ),
      itemCount: sections.length,
      itemBuilder: (_, index) => _buildSection(sections[index]),
        separatorBuilder: (_, _) => SizedBox(height: AppHeight.h24),
      ),
    );
  }

  Widget _buildSection(Section section) {
    final title = section.title?.trim() ?? '';
    final description = section.description?.trim() ?? '';
    final fields = (section.fields ?? const <SectionField>[])
        .where(_isFieldVisible)
        .toList(growable: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OrderSectionHeader(
          icon: section.id == 'company-location'
              ? Iconsax.location_outline
              : Iconsax.personalcard_outline,
          title: title,
          description: description,
          descriptionMaxLines: 2,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: fields.length,
          itemBuilder: (_, index) => _buildField(fields[index]),
          separatorBuilder: (_, _) => SizedBox(height: AppHeight.h8),
        ),
      ],
    );
  }

  bool _isFieldVisible(SectionField field) {
    final condition = field.visibleIf;
    if (condition == null) return true;

    final controllingField = condition.field;
    if (controllingField == null) return true;

    return (condition.visibleIfIn ?? const <String>[]).contains(
      selectedValues[controllingField],
    );
  }

  Widget _buildField(SectionField field) {
    final label = field.label?.trim() ?? '';
    final hint = field.placeholder?.trim() ?? '';

    switch (field.type) {
      case 'select':
        return OrderFormDropdown<String?>(
          label: label,
          hint: hint,
          value: selectedValues[field.id],
          isRequired: field.required ?? false,
          options: (field.options ?? const <FluffyOption>[])
              .map(
                (option) => OrderDropdownOption(
                  label: option.label?.trim() ?? '',
                  value: option.value,
                ),
              )
              .toList(),
          onChanged: (value) {
            if (field.id != null) onFieldChanged(field.id!, value);
          },
        );
      case 'info':
        return OrderInfoCard(text: label, maxLines: 2);
      default:
        return OrderFormInputField(
          key: ValueKey(field.id),
          label: label,
          hint: hint,
          value: selectedValues[field.id],
          isRequired: field.required ?? false,
          keyboardType: field.id == 'englishName'
              ? TextInputType.name
              : TextInputType.text,
          onChanged: (value) {
            if (field.id != null) onFieldChanged(field.id!, value);
          },
        );
    }
  }
}
