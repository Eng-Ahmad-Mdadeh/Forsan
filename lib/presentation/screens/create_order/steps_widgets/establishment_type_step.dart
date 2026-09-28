import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_option_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class EstablishmentTypeStep extends StatelessWidget {
  const EstablishmentTypeStep({
    super.key,
    required this.formKey,
    required this.step,
    required this.selectedValues,
    required this.onFieldChanged,
  });

  final GlobalKey<FormState> formKey;
  final StepModel step;
  final Map<String, dynamic> selectedValues;
  final void Function(String fieldId, dynamic value) onFieldChanged;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(
          AppPaddingWidth.p10,
          AppPaddingHeight.p8,
          AppPaddingWidth.p10,
          AppPaddingHeight.p16,
        ),
        itemCount: step.sections?.length ?? 0,
        itemBuilder: (_, index) {
          final section = step.sections![index];
          final isEstablishmentSection = section.id == 'establishment-type';

          return _OrderSection(
            section: section,
            icon: isEstablishmentSection
                ? Icons.grid_view_rounded
                : Icons.person_outline_rounded,
            fallbackDescription: isEstablishmentSection
                ? context.loc.new_order_establishment_description
                : context.loc.new_order_applicant_role_description,
            selectedValues: selectedValues,
            onFieldChanged: onFieldChanged,
          );
        },
        separatorBuilder: (_, _) => SizedBox(height: AppHeight.h10),
      ),
    );
  }
}

class _OrderSection extends StatelessWidget {
  const _OrderSection({
    required this.section,
    required this.icon,
    required this.fallbackDescription,
    required this.selectedValues,
    required this.onFieldChanged,
  });

  final Section section;
  final IconData icon;
  final String fallbackDescription;
  final Map<String, dynamic> selectedValues;
  final void Function(String fieldId, dynamic value) onFieldChanged;

  @override
  Widget build(BuildContext context) {
    final description = section.description?.trim();
    final fields = section.fields ?? const <SectionField>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(icon, size: AppSize.s16, color: AppColors.secondary),
            SizedBox(width: AppWidth.w6),
            Expanded(
              child: SectionTitle(
                text: section.title?.trim() ?? '',
                color: AppColors.primaryDark,
                fontSize: AppFontSize.s14,
              ),
            ),
          ],
        ),
        SizedBox(height: AppHeight.h8),
        BodyTitle(
          text: description == null || description.isEmpty
              ? fallbackDescription
              : description,
          color: AppColors.secondaryText,
          fontSize: AppFontSize.s12,
          fontWeight: AppFontWeight.regular,
          maxLines: 2,
        ),
        SizedBox(height: AppHeight.h10),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: fields.length,
          itemBuilder: (_, index) => _OrderField(
            field: fields[index],
            icon: icon,
            selectedValue: selectedValues[fields[index].id],
            onChanged: (value) {
              final fieldId = fields[index].id;
              if (fieldId != null) onFieldChanged(fieldId, value);
            },
          ),
          separatorBuilder: (_, _) => SizedBox(height: AppHeight.h10),
        ),
      ],
    );
  }
}

class _OrderField extends StatelessWidget {
  const _OrderField({
    required this.field,
    required this.icon,
    required this.selectedValue,
    required this.onChanged,
  });

  final SectionField field;
  final IconData icon;
  final dynamic selectedValue;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final options = (field.options ?? const <FluffyOption>[])
        .where((option) => option.value != null)
        .toList(growable: false);

    return FormField<String>(
      key: ValueKey('${field.id}:$selectedValue'),
      initialValue: selectedValue is String ? selectedValue : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          field.required == true && (value == null || value.trim().isEmpty)
          ? context.loc.complete_profile_required_field
          : null,
      builder: (formField) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: options.length,
              itemBuilder: (_, index) {
                final option = options[index];

                return OrderOptionCard(
                  title: option.label?.trim() ?? '',
                  description: option.description?.trim() ?? '',
                  icon: icon,
                  selected: formField.value == option.value,
                  onTap: () {
                    formField.didChange(option.value);
                    onChanged(option.value!);
                  },
                );
              },
              separatorBuilder: (_, _) => SizedBox(height: AppHeight.h10),
            ),
            if (formField.hasError) ...[
              SizedBox(height: AppHeight.h6),
              BodyTitle(
                text: formField.errorText!,
                color: AppColors.red,
                fontSize: AppFontSize.s12,
                fontWeight: AppFontWeight.regular,
              ),
            ],
          ],
        );
      },
    );
  }
}
