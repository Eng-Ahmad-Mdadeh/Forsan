import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class OrderStepIndicator extends StatelessWidget {
  const OrderStepIndicator({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final labels = [
      context.loc.new_order_step_establishment,
      context.loc.new_order_step_applicant,
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(labels.length * 2 - 1, (index) {
        if (index.isOdd) {
          final connectorIndex = index ~/ 2;
          return Expanded(
            child: _StepConnector(
              startComplete: currentStep >= connectorIndex,
              endComplete: currentStep > connectorIndex,
            ),
          );
        }

        final step = index ~/ 2;
        return _StepNode(
          number: step + 1,
          label: labels[step],
          active: step == currentStep,
          complete: step < currentStep,
        );
      }),
    );
  }
}

class _StepNode extends StatelessWidget {
  const _StepNode({
    required this.number,
    required this.label,
    required this.active,
    required this.complete,
  });

  final int number;
  final String label;
  final bool active;
  final bool complete;

  @override
  Widget build(BuildContext context) {
    final highlighted = active || complete;

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
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: highlighted ? AppColors.primary : AppColors.lightActive,
                border: highlighted
                    ? Border.all(
                        color: AppColors.secondary,
                        width: AppWidth.w2,
                      )
                    : null,
              ),
              child: complete
                  ? Icon(
                      Icons.check_rounded,
                      color: AppColors.secondary,
                      size: AppSize.s20,
                    )
                  : BodyTitle(
                      text: '$number',
                      color: active
                          ? AppColors.white
                          : AppColors.secondaryText,
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
            color: highlighted
                ? AppColors.primary
                : AppColors.secondaryText,
            fontSize: AppFontSize.s11,
            fontWeight: AppFontWeight.regular,
          ),
        ],
      ),
    );
  }
}

class _StepConnector extends StatelessWidget {
  const _StepConnector({
    required this.startComplete,
    required this.endComplete,
  });

  final bool startComplete;
  final bool endComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppPaddingHeight.p23),
      child: Row(
        children: [
          Expanded(child: _ConnectorLine(complete: startComplete)),
          Transform.rotate(
            angle: 0.785,
            child: Container(
              width: AppWidth.w10,
              height: AppHeight.h10,
              color: startComplete
                  ? AppColors.secondary
                  : AppColors.lightActive,
            ),
          ),
          Expanded(child: _ConnectorLine(complete: endComplete)),
        ],
      ),
    );
  }
}

class _ConnectorLine extends StatelessWidget {
  const _ConnectorLine({required this.complete});

  final bool complete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h2,
      color: complete ? AppColors.primary : AppColors.lightActive,
    );
  }
}
