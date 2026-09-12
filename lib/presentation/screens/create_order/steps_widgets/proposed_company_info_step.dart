import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class ProposedCompanyInfoStep extends StatelessWidget {
  const ProposedCompanyInfoStep({super.key});

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
                Icons.badge_outlined,
                color: AppColors.secondary,
                size: AppSize.s18,
              ),
              SizedBox(width: AppWidth.w5),
              Expanded(
                child: SectionTitle(
                  text: context.loc.new_order_proposed_company_info_title,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s18,
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
          SizedBox(height: AppHeight.h16),
          CustomInputField(
            title: context.loc.new_order_proposed_company_name,
            hintText: context.loc.new_order_proposed_company_name_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h12),
          CustomInputField(
            title: context.loc.new_order_company_activity,
            hintText: context.loc.new_order_company_activity_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h12),
          CustomInputField(
            title: context.loc.new_order_company_headquarters,
            hintText: context.loc.new_order_company_headquarters_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h12),
          CustomInputField(
            title: context.loc.new_order_company_capital,
            hintText: context.loc.new_order_company_capital_hint,
            fontSize: AppFontSize.s16,
            textInputType: TextInputType.number,
            backgroundColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
