import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';

class BiometricIllustration extends StatelessWidget {
  const BiometricIllustration({super.key, this.showCheck = false});

  final bool showCheck;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: showCheck ? AppWidth.w86 : AppWidth.w132,
    height: showCheck ? AppHeight.h86 : AppHeight.h132,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: showCheck ? AppColors.secondaryLight : AppColors.white,
            border: Border.all(
              color: AppColors.primary,
              width: showCheck ? AppWidth.w1 : AppWidth.w5,
            ),
          ),
        ),
        Icon(
          Icons.fingerprint_rounded,
          color: AppColors.primary,
          size: showCheck ? AppSize.s58 : AppSize.s65,
        ),
        if (showCheck)
          PositionedDirectional(
            end: 0,
            bottom: 0,
            child: Container(
              width: AppWidth.w30,
              height: AppHeight.h30,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_rounded,
                color: AppColors.primary,
                size: AppSize.s30,
              ),
            ),
          ),
      ],
    ),
  );
}
