import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class ConfirmRequirementsButton extends StatelessWidget {
  const ConfirmRequirementsButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => CustomElevatedButton(
    width: double.infinity,
    height: AppHeight.h52,
    color: AppColors.primary,
    borderRadius: AppRadius.r12,
    onPressed: onPressed,
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
  );
}
