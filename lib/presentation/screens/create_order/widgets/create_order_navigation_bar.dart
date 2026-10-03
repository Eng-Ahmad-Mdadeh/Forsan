import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class CreateOrderNavigationBar extends StatelessWidget {
  const CreateOrderNavigationBar({
    super.key,
    required this.currentStep,
    required this.lastStep,
    required this.onPrevious,
    required this.onNext,
  });

  final int currentStep;
  final int lastStep;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppPaddingWidth.p16,
        AppPaddingHeight.p8,
        AppPaddingWidth.p16,
        AppPaddingHeight.p16,
      ),
      child: Row(
        children: [
          if (currentStep > 0) ...[
            Expanded(
              child: CustomElevatedButton(
                key: const Key('new_order_previous_button'),
                height: AppHeight.h50,
                color: AppColors.lightActive,
                onPressed: onPrevious,
                child: _ButtonContent(
                  text: context.loc.new_order_previous,
                  icon: Icons.arrow_back_rounded,
                  iconFirst: true,
                ),
              ),
            ),
            SizedBox(width: AppPaddingWidth.p12),
          ],
          Expanded(
            child: CustomElevatedButton(
              key: const Key('new_order_next_button'),
              height: AppHeight.h50,
              color: AppColors.primary,
              onPressed: onNext,
              child: _ButtonContent(
                text: currentStep == lastStep
                    ? context.loc.new_order_submit
                    : context.loc.new_order_next,
                icon: Icons.arrow_forward_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.text,
    required this.icon,
    this.iconFirst = false,
  });

  final String text;
  final IconData icon;
  final bool iconFirst;

  @override
  Widget build(BuildContext context) {
    final textWidget = BodyTitle(
      text: text,
      color: AppColors.white,
      fontWeight: AppFontWeight.semiBold,
    );
    final iconWidget = Icon(icon, size: AppSize.s18, color: AppColors.white);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: iconFirst
          ? [iconWidget, SizedBox(width: AppWidth.w4), textWidget]
          : [textWidget, SizedBox(width: AppWidth.w4), iconWidget],
    );
  }
}
