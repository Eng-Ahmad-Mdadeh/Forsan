import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/order_option_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class EstablishmentTypeStep extends StatelessWidget {
  const EstablishmentTypeStep({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.selectedApplicantValue,
    required this.onApplicantChanged,
    required this.step,
  });

  final StepModel step;
  final String selectedValue;
  final ValueChanged<String> onChanged;
  final String selectedApplicantValue;
  final ValueChanged<String> onApplicantChanged;

  @override
  Widget build(BuildContext context) {
    final sections = (step.sections ?? const <Section>[])
        .where(
          (section) =>
              section.id == 'establishment-type' ||
              section.id == 'applicant-status',
        )
        .toList(growable: false);

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(
        AppPaddingWidth.p10,
        AppPaddingHeight.p8,
        AppPaddingWidth.p10,
        AppPaddingHeight.p16,
      ),
      itemCount: sections.length,
      itemBuilder: (_, index) {
        final section = sections[index];
        final isEstablishmentSection = section.id == 'establishment-type';

        return _OrderSection(
          section: section,
          icon: isEstablishmentSection
              ? Icons.grid_view_rounded
              : Icons.person_outline_rounded,
          fallbackDescription: isEstablishmentSection
              ? context.loc.new_order_establishment_description
              : context.loc.new_order_applicant_role_description,
          selectedValue:
              isEstablishmentSection ? selectedValue : selectedApplicantValue,
          onChanged:
              isEstablishmentSection ? onChanged : onApplicantChanged,
        );
      },
      separatorBuilder: (_, _) => SizedBox(height: AppHeight.h10),
    );
  }
}

class _OrderSection extends StatelessWidget {
  const _OrderSection({
    required this.section,
    required this.icon,
    required this.fallbackDescription,
    required this.selectedValue,
    required this.onChanged,
  });

  final Section section;
  final IconData icon;
  final String fallbackDescription;
  final String selectedValue;
  final ValueChanged<String> onChanged;

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
            selectedValue: selectedValue,
            onChanged: onChanged,
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
  final String selectedValue;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final options = (field.options ?? const <FluffyOption>[])
        .where((option) => option.value != null)
        .toList(growable: false);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      itemBuilder: (_, index) {
        final option = options[index];

        return OrderOptionCard(
          title: option.label?.trim() ?? '',
          description: option.description?.trim() ?? '',
          icon: icon,
          selected: selectedValue == option.value,
          onTap: () => onChanged(option.value!),
        );
      },
      separatorBuilder: (_, _) => SizedBox(height: AppHeight.h10),
    );
  }
}
