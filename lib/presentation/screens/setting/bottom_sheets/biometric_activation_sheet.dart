import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/setting/widgets/biometric_illustration.dart';
import 'package:forsan/presentation/screens/setting/widgets/sheet_close_button.dart';
import 'package:forsan/presentation/widgets/custom_bottom_sheet.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

Future<bool?> showBiometricActivationSheet(BuildContext context) {
  return CustomBottomSheet.show<bool>(
    context,
    title: '',
    showHeader: false,
    isScroll: false,
    heightFactor: .43,
    borderRadius: AppRadius.r14,
    backgroundColor: AppColors.white,
    padding: EdgeInsets.symmetric(
      horizontal: AppPaddingWidth.p20,
      vertical: AppPaddingHeight.p10,
    ),
    body: Column(
      children: [
        SheetCloseButton(onTap: () => Navigator.of(context).pop(false)),
        const BiometricIllustration(showCheck: true),
        SizedBox(height: AppHeight.h12),
        SectionTitle(
          text: context.loc.biometric_activation_title,
          color: AppColors.primary,
          fontSize: AppFontSize.s18,
        ),
        SizedBox(height: AppHeight.h8),
        BodyTitle(
          text: context.loc.biometric_activation_description,
          color: AppColors.greyText,
          fontSize: AppFontSize.s14,
          fontWeight: AppFontWeight.regular,
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          height: AppHeight.h50,
          child: FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.r7),
              ),
            ),
            child: BodyTitle(
              text: 'تفعيل',
              color: AppColors.white,
              fontSize: AppFontSize.s16,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: BodyTitle(
            text: context.loc.later,
            color: AppColors.primary,
            fontSize: AppFontSize.s14,
          ),
        ),
      ],
    ),
  );
}
