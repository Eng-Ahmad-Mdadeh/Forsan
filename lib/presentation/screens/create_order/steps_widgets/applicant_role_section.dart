import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/establishment_type_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class ApplicantRoleSection extends StatelessWidget {
  const ApplicantRoleSection({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  final String selectedValue;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final options = [
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(
              Icons.person_outline_rounded,
              size: AppSize.s17,
              color: AppColors.secondary,
            ),
            SizedBox(width: AppWidth.w6),
            Expanded(
              child: SectionTitle(
                text: context.loc.new_order_applicant_role_title,
                color: AppColors.primary,
                fontSize: AppFontSize.s18,
              ),
            ),
          ],
        ),
        SizedBox(height: AppHeight.h4),
        BodyTitle(
          text: context.loc.new_order_applicant_role_description,
          color: AppColors.greyText,
          fontSize: AppFontSize.s13,
          fontWeight: AppFontWeight.regular,
          maxLines: 2,
        ),
        SizedBox(height: AppHeight.h10),
        for (final option in options) ...[
          OrderOptionCard(
            title: option.title,
            description: option.description,
            icon: option.icon,
            height: AppHeight.h75,
            selected: selectedValue == option.value,
            onTap: () => onChanged(option.value),
          ),
          SizedBox(height: AppHeight.h12),
        ],
      ],
    );
  }
}
