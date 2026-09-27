import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/widgets/custom_drop_down_widget.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class ProposedCompanyInfoStep extends StatelessWidget {
  final StepModel step;
  final Map<String, String> selectedValues;
  final void Function(String fieldId, String value) onFieldChanged;

  const ProposedCompanyInfoStep({
    super.key,
    required this.step,
    required this.selectedValues,
    required this.onFieldChanged,
  });

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
      itemBuilder: (_, index) => _buildSection(context, sections[index]),
      separatorBuilder: (_, _) => SizedBox(height: AppHeight.h24),
    );
  }

  Widget _buildSection(BuildContext context, Section section) {
    final title = section.title?.trim() ?? '';
    final description = section.description?.trim() ?? '';
    final fields = (section.fields ?? const <SectionField>[])
        .where(_isFieldVisible)
        .toList(growable: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title.isNotEmpty) ...[
          Row(
            children: [
              Icon(
                section.id == 'company-location'
                    ? Iconsax.location_outline
                    : Iconsax.personalcard_outline,
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
            maxLines: 2,
          ),
          SizedBox(height: AppHeight.h8),
        ],
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: fields.length,
          itemBuilder: (_, index) => _buildField(context, fields[index]),
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

    return (condition.visibleIfIn ?? const <String>[])
        .contains(selectedValues[controllingField]);
  }

  Widget _buildField(BuildContext context, SectionField field) {
    final label = field.label?.trim() ?? '';
    final hint = field.placeholder?.trim() ?? '';

    switch (field.type) {
      case 'select':
        return _buildDropdown(context, field: field, label: label, hint: hint);
      case 'info':
        return _buildInfoField(label);
      default:
        return CustomInputField(
          title: label,
          hintText: hint,
          fontSize: AppFontSize.s16,
          textInputType: field.id == 'englishName'
              ? TextInputType.name
              : TextInputType.text,
          backgroundColor: AppColors.white,
        );
    }
  }

  Widget _buildInfoField(String text) {
    return SectionCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p12,
        vertical: AppPaddingHeight.p10,
      ),
      borderRadius: BorderRadius.circular(AppRadius.r7),
      backgroundColor: AppColors.light,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: AppColors.primaryDark,
            size: AppSize.s20,
          ),
          SizedBox(width: AppWidth.w8),
          Expanded(
            child: BodyTitle(
              text: text,
              color: AppColors.secondaryText,
              fontSize: AppFontSize.s12,
              fontWeight: AppFontWeight.regular,
              textAlign: TextAlign.start,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(
    BuildContext context, {
    required SectionField field,
    required String label,
    required String hint,
  }) {
    final options = field.options ?? const <FluffyOption>[];
    final items = options
        .map((option) => option.label?.trim() ?? '')
        .where((option) => option.isNotEmpty)
        .toList(growable: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BodyTitle(
          text: label,
          textAlign: TextAlign.start,
          color: AppColors.mainText,
          fontSize: AppFontSize.s14,
          fontWeight: AppFontWeight.medium,
        ),
        SizedBox(height: AppHeight.h4),
        CustomDropDownWidget(
          items: items,
          isStringList: true,
          hintText: hint.isEmpty ? context.loc.new_order_select_hint : hint,
          color: AppColors.white,
          height: AppHeight.h50,
          borderRadius: AppRadius.r7,
          closedBorder: const Border.fromBorderSide(
            BorderSide(color: AppColors.greyDivider, width: .7),
          ),
          onChanged: (selectedLabel) {
            final selectedOption = options.where(
              (option) => option.label?.trim() == selectedLabel,
            );
            final fieldId = field.id;
            if (fieldId == null) return;

            onFieldChanged(
              fieldId,
              selectedOption.firstOrNull?.value ?? selectedLabel.toString(),
            );
          },
        ),
      ],
    );
  }
}
