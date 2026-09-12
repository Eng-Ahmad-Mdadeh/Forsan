import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class OwnershipStructureStep extends StatelessWidget {
  const OwnershipStructureStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppPaddingWidth.p16,
        AppPaddingHeight.p48,
        AppPaddingWidth.p16,
        AppPaddingHeight.p24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.key_outlined,
                color: AppColors.secondary,
                size: AppSize.s27,
              ),
              SizedBox(width: AppWidth.w6),
              Expanded(
                child: SectionTitle(
                  text: context.loc.new_order_ownership_structure_title,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s22,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h16),
          BodyTitle(
            text: context.loc.new_order_ownership_structure_description,
            textAlign: TextAlign.center,
            color: AppColors.secondaryText,
            fontSize: AppFontSize.s18,
            fontWeight: AppFontWeight.regular,
            maxLines: 2,
            height: 1.8,
          ),
        ],
      ),
    );
  }
}
