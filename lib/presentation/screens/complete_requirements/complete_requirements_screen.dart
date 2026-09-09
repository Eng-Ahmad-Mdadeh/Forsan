import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/document/document_section.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class CompleteRequirementsScreen extends StatelessWidget {
  const CompleteRequirementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: CustomAppBar(
        title: context.loc.order_complete_requirements,
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
            SizedBox(height: AppHeight.h24),
            SectionTitle(
              text: context.loc.complete_requirements_documents_title,
              fontSize: AppFontSize.s18,
            ),
            DocumentSection(
              title: context.loc.order_document_company_address,
              image: null,
              onTap: () {},
              uploadLabel: context.loc.complete_requirements_upload,
              uploadHint: context.loc.complete_requirements_upload_hint,
              paddingTop: AppPaddingHeight.p12,
            ),
            DocumentSection(
              title: context.loc.complete_requirements_conviction_certificate,
              image: null,
              onTap: () {},
              uploadLabel: context.loc.complete_requirements_upload,
              uploadHint: context.loc.complete_requirements_upload_hint,
              paddingTop: AppPaddingHeight.p12,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(
          AppPaddingWidth.p16,
          AppPaddingHeight.p10,
          AppPaddingWidth.p16,
          AppPaddingHeight.p16,
        ),
        child: CustomElevatedButton(
          width: double.infinity,
          height: AppHeight.h52,
          color: AppColors.primary,
          borderRadius: AppRadius.r12,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                color: AppColors.white,
                size: AppSize.s22,
              ),
              SizedBox(width: AppWidth.w8),
              BodyTitle(
                text: context.loc.complete_requirements_confirm,
                color: AppColors.white,
                fontSize: AppFontSize.s16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
