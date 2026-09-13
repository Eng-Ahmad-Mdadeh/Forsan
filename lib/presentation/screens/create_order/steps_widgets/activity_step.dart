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

class ActivityStep extends StatelessWidget {
  ActivityStep({super.key});

  final descriptionController = TextEditingController();
  final subDescriptionController = TextEditingController();
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
                Iconsax.activity_outline,
                size: AppSize.s16,
                color: AppColors.secondary,
              ),
              SizedBox(width: AppWidth.w4),
              Expanded(
                child: SectionTitle(
                  text: context.loc.new_order_activity_title,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h8),
          BodyTitle(
            text:
                context.loc.new_order_activity_description,
            color: AppColors.secondaryText,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
            maxLines: 2,
          ),
          SizedBox(height: AppHeight.h8),
          _buildDropdown(
            context,
            label: context.loc.new_order_main_activity,
            items: [
              context.loc.new_order_trade,
              context.loc.new_order_industry,
              context.loc.new_order_services,
              context.loc.new_order_agriculture,
              context.loc.new_order_education,
              context.loc.new_order_health,
              context.loc.new_order_tourism,
            ],
          ),
          SizedBox(height: AppHeight.h8),
          _buildDropdown(
            context,
            label: context.loc.new_order_requires_special_license,
            items: [context.loc.new_order_yes, context.loc.new_order_no],
          ),
          SizedBox(height: AppHeight.h10),
          CustomInputField(
            title: context.loc.new_order_activity_description_label,
            hintText: context.loc.new_order_activity_description_hint,
            fontSize: AppFontSize.s16,
            backgroundColor: AppColors.white,
            maxLines: 4,
            maxLength: 100,
            isExpanded: true,
            controller: descriptionController,
            showCharacterCounter: true,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: BodyTitle(
                      text: context.loc.new_order_sub_activity_description_label,
                      color: AppColors.mainText,
                      fontSize: AppFontSize.s14,
                      fontWeight: AppFontWeight.medium,
                    ),
                  ),
                  SizedBox(
                    width: AppWidth.w24,
                    height: AppHeight.h24,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      tooltip: context.loc.new_order_delete_sub_activity,
                      onPressed: subDescriptionController.clear,
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: AppColors.red,
                        size: AppSize.s20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppHeight.h4),
              CustomInputField(
                hintText: context.loc.new_order_sub_activity_description_hint,
                fontSize: AppFontSize.s16,
                backgroundColor: AppColors.white,
                maxLines: 4,
                maxLength: 100,
                isExpanded: true,
                controller: subDescriptionController,
                showCharacterCounter: true,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top:AppPaddingHeight.p16,
              bottom:AppPaddingHeight.p100,
            ),
            child: CustomElevatedButton(
              key: const Key('new_order_add_sub_activity'),
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
                      text: context.loc.new_order_add_sub_activity,
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
