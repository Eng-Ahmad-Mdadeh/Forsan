import 'package:country_picker/country_picker.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/widgets/custom_drop_down_widget.dart';
import 'package:forsan/presentation/widgets/custom_check_box.dart';
import 'package:forsan/presentation/widgets/custom_text_from_field.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ApplicantStep extends StatefulWidget {
  final StepModel step;

  const ApplicantStep({super.key, required this.step});

  @override
  State<ApplicantStep> createState() => _ApplicantStepState();
}

class _ApplicantStepState extends State<ApplicantStep> {
  Country _selectedCountry = Country.parse('SY');

  @override
  Widget build(BuildContext context) {
    final sections = widget.step.sections ?? const <Section>[];

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
        return _buildDropdown(
          context,
          label: label,
          hint: hint,
          items: (field.options ?? const <FluffyOption>[])
              .map((option) => option.label?.trim() ?? '')
              .where((option) => option.isNotEmpty)
              .toList(growable: false),
        );
      case 'phone':
        return _buildPhoneField(context, label: label, hint: hint);
      default:
        return CustomInputField(
          title: label,
          hintText: hint,
          fontSize: AppFontSize.s16,
          textInputType: _textInputType(field),
          backgroundColor: AppColors.white,
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
    final field = section.fields?.firstOrNull;

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
        Container(
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
                      text: field?.label?.trim() ??
                          context.loc.new_order_has_representative_in_syria,
                      color: AppColors.mainText,
                      fontSize: AppFontSize.s12,
                      fontWeight: AppFontWeight.bold,
                      maxLines: 2,
                    ),
                    SizedBox(height: AppHeight.h6),
                    BodyTitle(
                      text: field?.hint?.trim() ??
                          context.loc
                              .new_order_representative_details_description,
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
        ),
        SizedBox(height: AppHeight.h100),
      ],
    );
  }

  Widget _buildDropdown(
    BuildContext context, {
    required String label,
    required String hint,
    required List<String> items,
  }) {
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
          onChanged: (_) {},
        ),
      ],
    );
  }

  Widget _buildPhoneField(
    BuildContext context, {
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BodyTitle(
          text: label,
          textAlign: TextAlign.start,
          fontSize: AppFontSize.s14,
          fontWeight: AppFontWeight.medium,
          color: AppColors.mainText,
        ),
        SizedBox(height: AppHeight.h4),
        Directionality(
          textDirection: TextDirection.ltr,
          child: CustomTextFromField(
            maxLines: 1,
            textInputType: TextInputType.phone,
            textDirection: TextDirection.ltr,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: AppColors.primary,
            cursorHeight: AppHeight.h20,
            fontSize: AppFontSize.s16,
            hintText: hint,
            hintColor: AppColors.grey,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            contentPaddingTop: 0,
            contentPaddingBottom: 0,
            contentPaddingStart: AppPaddingWidth.p12,
            contentPaddingEnd: AppPaddingWidth.p12,
            prefixIcon: _CountryDialCode(
              country: _selectedCountry,
              onTap: _showCountryPicker,
            ),
            suffixIcon: Icon(
              LucideIcons.phone,
              size: AppFontSize.s16,
              color: AppColors.primaryDark,
            ),
            filled: true,
            color: AppColors.white,
            borderRadius: AppRadius.r7,
            enableInputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.r7),
              borderSide: const BorderSide(color: AppColors.lightGrey),
            ),
            focusedInputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.r7),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            errorInputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.r7),
              borderSide: const BorderSide(color: AppColors.red),
            ),
          ),
        ),
      ],
    );
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: const ['SY'],
      onSelect: (country) => setState(() => _selectedCountry = country),
    );
  }
}

class _CountryDialCode extends StatelessWidget {
  const _CountryDialCode({required this.country, required this.onTap});

  final Country country;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppPaddingWidth.p8,
          end: AppPaddingWidth.p8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              country.flagEmoji,
              style: TextStyle(fontSize: AppFontSize.s20),
            ),
            SizedBox(width: AppWidth.w5),
            BodyTitle(
              text: '+${country.phoneCode}',
              fontSize: AppFontSize.s14,
              color: AppColors.mainText,
            ),
            SizedBox(width: AppWidth.w3),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: AppFontSize.s18,
              color: AppColors.greyText,
            ),
            SizedBox(width: AppWidth.w5),
            Container(
              width: 1,
              height: AppHeight.h24,
              color: AppColors.lightGrey,
            ),
          ],
        ),
      ),
    );
  }
}
