import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
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
  });

  final String selectedValue;
  final ValueChanged<String> onChanged;
  final String selectedApplicantValue;
  final ValueChanged<String> onApplicantChanged;

  @override
  Widget build(BuildContext context) {
    final options = [
      (
        value: 'one_person',
        title: context.loc.new_order_one_person_company,
        description: context.loc.new_order_one_person_company_description,
        icon: Icons.person_outline_rounded,
      ),
      (
        value: 'limited_liability',
        title: context.loc.new_order_limited_liability_company,
        description:
            context.loc.new_order_limited_liability_company_description,
        icon: Icons.domain_outlined,
      ),
      (
        value: 'foreign_partner',
        title: context.loc.new_order_foreign_partner_company,
        description: context.loc.new_order_foreign_partner_company_description,
        icon: Icons.public_rounded,
      ),
      (
        value: 'individual',
        title: context.loc.new_order_individual_establishment,
        description:
            context.loc.new_order_individual_establishment_description,
        icon: Icons.account_tree_outlined,
      ),
      (
        value: 'joint_stock',
        title: context.loc.new_order_joint_stock_company,
        description: context.loc.new_order_joint_stock_company_description,
        icon: Icons.groups_2_outlined,
      ),
    ];
    final applicantOptions = [
      (
        value: 'syrian_citizen',
        title: context.loc.new_order_syrian_citizen,
        description: context.loc.new_order_syrian_citizen_description,
        icon: Icons.account_circle_outlined,
      ),
      (
        value: 'expatriate',
        title: context.loc.new_order_expatriate,
        description: context.loc.new_order_expatriate_description,
        icon: Icons.flight_takeoff_rounded,
      ),
      (
        value: 'foreign_investor',
        title: context.loc.new_order_foreign_investor,
        description: context.loc.new_order_foreign_investor_description,
        icon: Icons.person_add_alt_outlined,
      ),
      (
        value: 'company_representative',
        title: context.loc.new_order_company_representative,
        description: context.loc.new_order_company_representative_description,
        icon: Icons.manage_accounts_outlined,
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        AppPaddingWidth.p10,
        AppPaddingHeight.p8,
        AppPaddingWidth.p10,
        AppPaddingHeight.p16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.grid_view_rounded,
                size: AppSize.s16,
                color: AppColors.secondary,
              ),
              SizedBox(width: AppWidth.w4),
              Expanded(
                child: SectionTitle(
                  text: context.loc.new_order_establishment_title,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h8),
          BodyTitle(
            text: context.loc.new_order_establishment_description,
            color: AppColors.secondaryText,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
            maxLines: 2,
          ),
          SizedBox(height: AppHeight.h10),
          for (final option in options) ...[
            OrderOptionCard(
              title: option.title,
              description: option.description,
              icon: option.icon,
              selected: selectedValue == option.value,
              onTap: () => onChanged(option.value),
            ),
            SizedBox(height: AppHeight.h12),
          ],
          SizedBox(height: AppHeight.h8),
          Row(
            children: [
              Icon(
                Icons.person_outline_rounded,
                size: AppSize.s16,
                color: AppColors.secondary,
              ),
              SizedBox(width: AppWidth.w6),
              Expanded(
                child: SectionTitle(
                  text: context.loc.new_order_applicant_role_title,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h8),
          BodyTitle(
            text: context.loc.new_order_applicant_role_description,
            color: AppColors.secondaryText,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
            maxLines: 2,
          ),
          SizedBox(height: AppHeight.h10),
          for (final option in applicantOptions) ...[
            OrderOptionCard(
              title: option.title,
              description: option.description,
              icon: option.icon,
              height: AppHeight.h80,
              selected: selectedApplicantValue == option.value,
              onTap: () => onApplicantChanged(option.value),
            ),
            SizedBox(height: AppHeight.h12),
          ],
        ],
      ),
    );
  }
}
