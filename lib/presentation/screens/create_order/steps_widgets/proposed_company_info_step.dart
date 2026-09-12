import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_drop_down_widget.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class ProposedCompanyInfoStep extends StatefulWidget {
  const ProposedCompanyInfoStep({super.key});

  @override
  State<ProposedCompanyInfoStep> createState() => _ProposedCompanyInfoStepState();
}

class _ProposedCompanyInfoStepState extends State<ProposedCompanyInfoStep> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        AppPaddingWidth.p16,
        AppPaddingHeight.p8,
        AppPaddingWidth.p16,
        AppPaddingHeight.p24,
      ),
      child: Column(
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
                  text: context.loc.new_order_proposed_company_info_title,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h8),
          BodyTitle(
            text: context.loc.new_order_proposed_company_info_description,
            color: AppColors.secondaryText,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
          ),
          SizedBox(height: AppHeight.h8),
          CustomInputField(
            title: context.loc.new_order_proposed_company_name,
            hintText: context.loc.new_order_proposed_company_name_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h8),
          CustomInputField(
            title: context.loc.new_order_second_proposed_company_name_optional,
            hintText: context.loc.new_order_second_proposed_company_name_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h8),
          CustomInputField(
            title: context.loc.new_order_third_proposed_company_name_optional,
            hintText: context.loc.new_order_third_proposed_company_name_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h8),
          CustomInputField(
            title: context.loc.new_order_company_name_english_optional,
            hintText: context.loc.new_order_company_name_english_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h8),
          _buildDropdown(
            context,
            label: context.loc.new_order_governorate,
            items: const [],
          ),
          SizedBox(height: AppHeight.h8),
          CustomInputField(
            title: context.loc.new_order_city_or_area,
            hintText: context.loc.new_order_city_or_area_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h8),
          _buildDropdown(
            context,
            label: context.loc.new_order_has_headquarters_currently,
            items: [context.loc.new_order_yes, context.loc.new_order_no],
          ),
          SizedBox(height: AppHeight.h8),
          CustomInputField(
            title: context.loc.new_order_headquarters_address,
            hintText: context.loc.new_order_headquarters_address_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h16),
          SectionCard(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(
              horizontal: AppPaddingWidth.p12,
              vertical: AppPaddingHeight.p10,
            ),
            borderRadius: BorderRadius.circular(AppRadius.r7),
            backgroundColor: AppColors.light,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.primaryDark,
                  size: AppSize.s20,
                ),
                SizedBox(width: AppWidth.w8),
                Expanded(
                  child: BodyTitle(
                    text: context.loc.new_order_trade_name_approval_notice,
                    color: AppColors.secondaryText,
                    fontSize: AppFontSize.s12,
                    fontWeight: AppFontWeight.regular,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(
    BuildContext context, {
    required String label,
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
          hintText: context.loc.new_order_select_hint,
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
}
