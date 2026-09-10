import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class OrderStepIndicator extends StatelessWidget {
  const OrderStepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return _StepNode(
      number: 1,
      label: context.loc.new_order_step_establishment,
    );
  }
}

class _StepNode extends StatelessWidget {
  const _StepNode({
    required this.number,
    required this.label,
  });

  final int number;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppWidth.w75,
      child: Column(
        children: [
          Container(
            width: AppWidth.w48,
            height: AppHeight.h48,
            padding: EdgeInsets.all(AppSize.s5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.light,
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
                border: Border.all(
                  color: AppColors.secondary,
                  width: AppWidth.w2,
                ),
              ),
              child: BodyTitle(
                text: '$number',
                color: AppColors.white,
                fontSize: AppFontSize.s14,
                fontWeight: AppFontWeight.medium,
              ),
            ),
          ),
          SizedBox(height: AppHeight.h5),
          BodyTitle(
            text: label,
            textAlign: TextAlign.center,
            maxLines: 1,
            color: AppColors.primary,
            fontSize: AppFontSize.s11,
            fontWeight: AppFontWeight.regular,
          ),
        ],
      ),
    );
  }
}
