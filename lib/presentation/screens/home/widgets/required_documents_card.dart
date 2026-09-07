import 'package:flutter/material.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/text/body_title.dart';

class RequiredDocumentsCard extends StatelessWidget {
  const RequiredDocumentsCard({super.key});

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p20,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondaryLightHover,
        borderRadius: BorderRadius.circular(AppRadius.r20),
        boxShadow: [
          BoxShadow(
            color: AppColors.homeSoftShadow,
            blurRadius: AppRadius.r10,
            offset: Offset(0, AppHeight.h4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: AppColors.secondaryNormal,
                      size: AppSize.s24,
                    ),
                    SizedBox(width: AppWidth.w8),
                    Expanded(
                      child: BodyTitle(
                        textSpan: TextSpan(
                          children: [
                            const TextSpan(text: 'إجراء مطلوب على الطلب '),
                            TextSpan(
                              text: 'FR-2026-001259',
                              style: TextStyle(
                                color: AppColors.mainText,
                                fontWeight: AppFontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        color: AppColors.mainText,
                        fontSize: AppFontSize.s14,
                        fontWeight: AppFontWeight.regular,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppHeight.h16),
                BodyTitle(
                  text:
                      'يرجى إرفاق المستندات المطلوبة لاستكمال\nمراجعة طلب تأسيس الشركة.',
                  color: AppColors.blackCow,
                  fontSize: AppFontSize.s14,
                  fontWeight: AppFontWeight.regular,
                  height: 1.6,
                ),
                SizedBox(height: AppHeight.h16),
                SizedBox(
                  height: AppHeight.h48,
                  child: FilledButton.icon(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.primary,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPaddingWidth.p20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.r12),
                      ),
                    ),
                    icon: Icon(
                      Icons.file_upload_outlined,
                      size: AppSize.s22,
                    ),
                    label: BodyTitle(
                      text: 'استكمال المتطلبات',
                      color: AppColors.white,
                      fontSize: AppFontSize.s14,
                      fontWeight: AppFontWeight.medium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: AppWidth.w12),
          Semantics(
            image: true,
            label: 'شعار فرسان',
            child: SizedBox(
              width: AppWidth.w85,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  AppColors.secondaryNormal,
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  AppAssets.fullLogo,
                  fit: BoxFit.contain,
                  excludeFromSemantics: true,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
