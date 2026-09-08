import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton({
    super.key,
    this.text = '',
    this.onPressed,
    this.marginTop,
    this.marginBottom,
    this.marginStart,
    this.marginEnd,
    this.verification = true,
    this.useGradient = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final double? marginTop;
  final double? marginBottom;
  final double? marginStart;
  final double? marginEnd;
  final bool verification;
  final bool useGradient;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      height: AppHeight.h55,
      width: double.infinity,
      elevation: 0,
      marginTop: marginTop,
      marginBottom: marginBottom,
      marginStart: marginStart,
      marginEnd: marginEnd,
      borderRadius: AppRadius.r7,
      color: useGradient ? null : (verification ? AppColors.primary : AppColors.greyText),
      gradient: useGradient
          ? LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: verification
                  ? [AppColors.primary, AppColors.primaryDarkHover]
                  : [AppColors.greyText, AppColors.greyText],
            )
          : null,
      onPressed: onPressed ?? () {},
      child: SectionTitle(text: text, color: AppColors.white, textAlign: TextAlign.center)
          .animate(key: ValueKey('$text-$verification'))
          .fade(duration: 220.ms)
          .moveY(begin: 12, end: 0, duration: 320.ms, curve: Curves.easeOutCubic)
          .scale(begin: const Offset(.97, .97), end: const Offset(1, 1), duration: 320.ms, curve: Curves.easeOutCubic),
    );
  }
}
