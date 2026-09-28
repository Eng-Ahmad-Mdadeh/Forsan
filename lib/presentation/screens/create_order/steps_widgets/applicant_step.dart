import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_form_dropdown.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_form_input_field.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_phone_field.dart';
import 'package:forsan/presentation/widgets/custom_check_box.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class ApplicantStep extends StatelessWidget {
  final StepModel step;

  const ApplicantStep({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    final sections = step.sections ?? const <Section>[];

    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p8,
      ),
      itemCount: sections.length,
      itemBuilder: (_, index) {
        final section = sections[index];

        if (section.id == 'local-representative') {
          return _buildDelegationSection(context, section);
        }

        return _buildApplicantSection(context, section);
      },
      separatorBuilder: (_, _) => SizedBox(height: AppHeight.h24),
    );
  }

  Widget _buildApplicantSection(BuildContext context, Section section) {
    final fields = section.fields ?? const <SectionField>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(
              Iconsax.personalcard_outline,
              size: AppSize.s16,
              color: AppColors.secondary,
            ),
            SizedBox(width: AppWidth.w4),
            Expanded(
              child: SectionTitle(
                text: section.title?.trim() ??
                    context.loc.new_order_contact_identity_title,
                color: AppColors.primaryDark,
                fontSize: AppFontSize.s14,
              ),
            ),
          ],
        ),
        SizedBox(height: AppHeight.h8),
        BodyTitle(
          text: section.description?.trim() ??
              context.loc.new_order_contact_identity_description,
          color: AppColors.secondaryText,
          fontSize: AppFontSize.s12,
          fontWeight: AppFontWeight.regular,
          maxLines: 2,
        ),
        SizedBox(height: AppHeight.h8),
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

  Widget _buildField(BuildContext context, SectionField field) {
    final label = field.label?.trim() ?? '';
    final hint = field.placeholder?.trim() ?? '';

    switch (field.type) {
      case 'select':
        return OrderFormDropdown<String?>(
          label: label,
          hint: hint,
          options: (field.options ?? const <FluffyOption>[])
              .map((option) => OrderDropdownOption(
                    label: option.label?.trim() ?? '',
                    value: option.value,
                  ))
              .toList(growable: false),
          onChanged: (_) {},
        );
      case 'phone':
        return OrderPhoneField(label: label, hint: hint);
      default:
        return OrderFormInputField(
          label: label,
          hint: hint,
          keyboardType: _textInputType(field),
        );
    }
  }

  TextInputType _textInputType(SectionField field) {
    if (field.type == 'email') return TextInputType.emailAddress;
    if (field.id == 'nationalId') return TextInputType.number;
    if (field.id == 'fullName' || field.id == 'fatherName') {
      return TextInputType.name;
    }
    return TextInputType.text;
  }

  Widget _buildDelegationSection(BuildContext context, Section section) {
    final fields = section.fields ?? const <SectionField>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.add_moderator_outlined,
              color: AppColors.secondary,
              size: AppSize.s17,
            ),
            SizedBox(width: AppWidth.w4),
            BodyTitle(
              text: section.title?.trim() ??
                  context.loc.new_order_delegation_in_syria,
              color: AppColors.primaryDark,
              fontSize: AppFontSize.s14,
              fontWeight: AppFontWeight.bold,
            ),
          ],
        ),
        SizedBox(height: AppHeight.h8),
        BodyTitle(
          text: section.description?.trim() ??
              context.loc.new_order_delegation_in_syria_description,
          textAlign: TextAlign.center,
          color: AppColors.secondaryText,
          fontSize: AppFontSize.s12,
          fontWeight: AppFontWeight.regular,
          maxLines: 2,
        ),
        SizedBox(height: AppHeight.h8),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: fields.length,
          itemBuilder: (_, index) =>
              _buildDelegationField(context, fields[index]),
          separatorBuilder: (_, _) => SizedBox(height: AppHeight.h8),
        ),
        SizedBox(height: AppHeight.h100),
      ],
    );
  }

  Widget _buildDelegationField(BuildContext context, SectionField field) {
    return Container(
      height: AppHeight.h60,
      padding: EdgeInsets.all(AppPaddingWidth.p6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.r10),
        boxShadow: [
          BoxShadow(
            color: AppColors.homeSoftShadow.withOpacity(0.05),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: AppWidth.w45,
            height: AppHeight.h45,
            decoration: BoxDecoration(
              color: AppColors.secondaryLight,
              borderRadius: BorderRadius.circular(AppRadius.r12),
            ),
            child: Icon(
              Icons.add_moderator_outlined,
              color: AppColors.secondary,
              size: AppSize.s24,
            ),
          ),
          SizedBox(width: AppWidth.w12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppHeight.h6),
                BodyTitle(
                  text: field.label?.trim() ??
                      context.loc.new_order_has_representative_in_syria,
                  color: AppColors.mainText,
                  fontSize: AppFontSize.s12,
                  fontWeight: AppFontWeight.bold,
                  maxLines: 2,
                ),
                SizedBox(height: AppHeight.h6),
                BodyTitle(
                  text: field.hint?.trim() ??
                      context.loc.new_order_representative_details_description,
                  color: AppColors.secondaryText,
                  fontSize: AppFontSize.s10,
                  fontWeight: AppFontWeight.regular,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          SizedBox(width: AppWidth.w8),
          CustomCheckBox(),
        ],
      ),
    );
  }
}
