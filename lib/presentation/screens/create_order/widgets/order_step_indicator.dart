import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';

class OrderStepIndicator extends StatelessWidget {
  const OrderStepIndicator({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final labels = [
      context.loc.new_order_step_establishment,
      context.loc.new_order_step_applicant,
      context.loc.new_order_step_company,
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(labels.length * 2 - 1, (index) {
        if (index.isOdd) {
          return Expanded(
            child: _StepConnector(active: index ~/ 2 < currentStep),
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
      width: AppWidth.w70,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: AppWidth.w33,
            height: AppHeight.h33,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active ? AppColors.primary : AppColors.light,
              border: Border.all(
                color: active ? AppColors.secondary : AppColors.lightActive,
                width: active ? AppWidth.w2 : AppWidth.w1,
              ),
              boxShadow: active
                  ? const [BoxShadow(color: AppColors.shadowPrimary, blurRadius: 6)]
                  : null,
            ),
            child: Text(
              '$number',
              style: TextStyle(
                color: active ? AppColors.white : AppColors.secondaryText,
                fontSize: AppFontSize.s12,
                fontWeight: AppFontWeight.medium,
              ),
            ),
          ),
          SizedBox(height: AppHeight.h5),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              color: highlighted ? AppColors.primary : AppColors.secondaryText,
              fontSize: AppFontSize.s10,
              fontWeight: active ? AppFontWeight.semiBold : AppFontWeight.regular,
            ),
          ),
        ],
      ),
    );
  }
}

class _StepConnector extends StatelessWidget {
  const _StepConnector({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppPaddingHeight.p16),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: AppHeight.h1,
              color: active ? AppColors.secondary : AppColors.lightActive,
            ),
          ),
          Transform.rotate(
            angle: 0.785,
            child: Container(
              width: AppWidth.w10,
              height: AppHeight.h10,
              color: active ? AppColors.secondary : AppColors.light,
            ),
          ),
          Expanded(
            child: Divider(
              height: AppHeight.h1,
              color: active ? AppColors.secondary : AppColors.lightActive,
            ),
          ),
        ],
      ),
    );
  }
}
