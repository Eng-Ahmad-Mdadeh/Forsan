import 'package:flutter/material.dart';

import '../../../../core/extension/localization_extension.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/text/body_title.dart';

class OrderRequiredActionCard extends StatelessWidget {
  const OrderRequiredActionCard({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Semantics(
      container: true,
      label: context.loc.order_required_action,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
          AppPaddingWidth.p20,
          AppPaddingHeight.p18,
          AppPaddingWidth.p20,
          AppPaddingHeight.p14,
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
                  child: BodyTitle(
                    text: context.loc.order_required_action,
                    color: AppColors.mainText,
                    fontSize: AppFontSize.s16,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppHeight.h12),
            BodyTitle(
              text: context.loc.order_required_documents_message,
              color: AppColors.blackCow,
              fontSize: AppFontSize.s14,
              fontWeight: AppFontWeight.regular,
              height: 1.5,
            ),
            SizedBox(height: AppHeight.h12),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: CustomElevatedButton(
                height: AppHeight.h48,
                onPressed: onPressed ?? () {},
                color: AppColors.secondaryNormal,
                borderRadius: AppRadius.r12,
                padding: EdgeInsets.symmetric(
                  horizontal: AppPaddingWidth.p20,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      size: AppSize.s22,
                      color: AppColors.white,
                    ),
                    SizedBox(width: AppWidth.w8),
                    BodyTitle(
                      text: context.loc.order_complete_requirements,
                      color: AppColors.white,
                      fontSize: AppFontSize.s14,
                      fontWeight: AppFontWeight.medium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
