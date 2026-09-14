import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_bottom_sheet.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

void showDeleteAccountSheet(BuildContext context) {
  CustomBottomSheet.show<void>(
    context,
    title: context.loc.delete_account,
    heightFactor: .38,
    borderRadius: AppRadius.r20,
    backgroundColor: AppColors.white,
    padding: EdgeInsets.symmetric(
      horizontal: AppPaddingWidth.p20,
      vertical: AppPaddingHeight.p20,
    ),
    body: Column(
      children: [
        Icon(
          Icons.warning_amber_rounded,
          color: AppColors.red,
          size: AppSize.s50,
        ),
        SizedBox(height: AppHeight.h15),
        BodyTitle(
          text: context.loc.delete_account_confirm_message,
          textAlign: TextAlign.center,
          color: AppColors.mainText,
          fontSize: AppFontSize.s16,
          fontWeight: AppFontWeight.medium,
          maxLines: 3,
        ),
        SizedBox(height: AppHeight.h25),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  minimumSize: Size.fromHeight(AppHeight.h50),
                ),
                child: BodyTitle(
                  text: context.loc.cancel,
                  color: AppColors.primary,
                  fontSize: AppFontSize.s16,
                ),
              ),
            ),
            SizedBox(width: AppWidth.w12),
            Expanded(
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.red,
                  minimumSize: Size.fromHeight(AppHeight.h50),
                ),
                child: BodyTitle(
                  text: context.loc.confirm,
                  color: AppColors.white,
                  fontSize: AppFontSize.s16,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
