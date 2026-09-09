import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class CompleteRequirementsScreen extends StatelessWidget {
  const CompleteRequirementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: context.loc.order_complete_requirements,
        backgroundColor: AppColors.white,
        showBackButton: true,
        centerTitle: true,
        showScrolledUnderElevation: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            AppPaddingWidth.p16,
            AppPaddingHeight.p20,
            AppPaddingWidth.p16,
            AppPaddingHeight.p24,
          ),
          children: [
            SectionCard(
              backgroundColor: AppColors.secondaryLightHover,
              borderRadius: BorderRadius.circular(AppRadius.r20),
              padding: EdgeInsets.symmetric(
                horizontal: AppPaddingWidth.p20,
                vertical: AppPaddingHeight.p24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: AppColors.secondaryNormal,
                        size: AppSize.s30,
                      ),
                      SizedBox(width: AppWidth.w8),
                      Expanded(
                        child: SectionTitle(
                          text: context.loc.order_required_action,
                          color: AppColors.mainText,
                          fontSize: AppFontSize.s16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppHeight.h12),
                  BodyTitle(
                    text: context.loc.complete_requirements_notice,
                    color: AppColors.blackCow,
                    fontSize: AppFontSize.s14,
                    fontWeight: AppFontWeight.regular,
                    height: 1.8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
