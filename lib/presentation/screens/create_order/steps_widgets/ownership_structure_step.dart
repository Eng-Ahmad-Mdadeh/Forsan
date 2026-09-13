import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_drop_down_widget.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class OwnershipStructureStep extends StatelessWidget {
  const OwnershipStructureStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.key_outlined,
                size: AppSize.s16,
                color: AppColors.secondary,
              ),
              SizedBox(width: AppWidth.w4),
              Expanded(
                child: SectionTitle(
                  text: context.loc.new_order_ownership_structure_title,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h8),
          BodyTitle(
            text: context.loc.new_order_ownership_structure_description,
            color: AppColors.secondaryText,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
            maxLines: 2,
          ),
          SizedBox(height: AppHeight.h8),
          _buildDropdown(
            context,
            label: context.loc.new_order_partner_count,
            items: ['1', '2', '3', '4', '5'],
          ),
          SizedBox(height: AppHeight.h8),
          CustomInputField(
            title: context.loc.new_order_expected_capital,
            hintText: context.loc.new_order_expected_capital_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h10),
          Row(
            children: [
              Icon(
                Iconsax.user_bold,
                size: AppSize.s16,
                color: AppColors.secondary,
              ),
              SizedBox(width: AppWidth.w4),
              Expanded(
                child: SectionTitle(
                  text: context.loc.new_order_primary_partner,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h8),
          CustomInputField(
            title: context.loc.new_order_full_name,
            hintText: context.loc.new_order_full_name_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h8),
          _buildDropdown(
            context,
            label: context.loc.new_order_nationality,
            items: [context.loc.new_order_male, context.loc.new_order_female],
          ),
          SizedBox(height: AppHeight.h8),
          CustomInputField(
            title: context.loc.new_order_ownership_percentage,
            hintText: context.loc.new_order_ownership_percentage_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h8),
          _buildDropdown(
            context,
            label: context.loc.new_order_contribution_type,
            items: [context.loc.new_order_cash_contribution, context.loc.new_order_in_kind_contribution, context.loc.new_order_mixed_contribution],
          ),
          SizedBox(height: AppHeight.h8),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: AppHeight.h8),
                height: AppHeight.h400,
                padding: EdgeInsets.only(
                  left: AppPaddingWidth.p16,
                  top: AppPaddingHeight.p50,
                  right: AppPaddingWidth.p16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.goldBackGround.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // لجعل الارتفاع متناسباً مع العناصر
                  children: [
                    CustomInputField(
                      title: context.loc.new_order_full_name,
                      hintText: context.loc.new_order_full_name_hint,
                      fontSize: AppFontSize.s16,
                      backgroundColor: AppColors.white,
                    ),
                    SizedBox(height: AppHeight.h8),
                    _buildDropdown(
                      context,
                      label: context.loc.new_order_nationality,
                      items: [
                        context.loc.new_order_male,
                        context.loc.new_order_female,
                      ],
                    ),
                    SizedBox(height: AppHeight.h8),
                    CustomInputField(
                      title: context.loc.new_order_ownership_percentage,
                      hintText: context.loc.new_order_ownership_percentage_hint,
                      fontSize: AppFontSize.s16,
                      backgroundColor: AppColors.white,
                    ),
                    SizedBox(height: AppHeight.h8),
                    _buildDropdown(
                      context,
                      label: context.loc.new_order_contribution_type,
                      items: [
                        context.loc.new_order_cash_contribution,
                        context.loc.new_order_in_kind_contribution,
                        context.loc.new_order_mixed_contribution,
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: AppHeight.h20,
                left: AppWidth.w14,
                child: GestureDetector(
                  onTap: () {
                  },
                  child:  Icon(
                    Icons.delete_outline,
                    color: Colors.redAccent,
                    size: AppSize.s24,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppPaddingWidth.p16,
              AppPaddingHeight.p16,
              AppPaddingWidth.p16,
              AppPaddingHeight.p100,
            ),
            child: CustomElevatedButton(
              key: const Key('new_order_add_partner'),
              width: double.infinity,
              height: AppHeight.h50,
              borderSide: BorderSide(color: AppColors.goldBackGround, width: 1),
              color: Color(0xFF0D3D35).withOpacity(0.10),
              borderRadius: AppRadius.r10,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.primaryDark,
                    size: AppSize.s16,
                  ),
                  SizedBox(width: AppWidth.w4),
                  Flexible(
                    child: SectionTitle(
                      text: context.loc.new_order_add_partner,
                      color: AppColors.primaryDark,
                      fontSize: AppFontSize.s14,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                ],
              ),
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
