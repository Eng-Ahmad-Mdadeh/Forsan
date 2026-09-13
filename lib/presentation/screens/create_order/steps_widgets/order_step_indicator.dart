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
      context.loc.new_order_step_establishment, // index 0 (خطوة 1)
      context.loc.new_order_step_applicant,     // index 1 (خطوة 2)
      context.loc.new_order_step_company_info,  // index 2 (خطوة 3)
      context.loc.new_order_step_partners,      // index 3 (خطوة 4)
      context.loc.new_order_step_activity,      // index 4 (خطوة 5)
      context.loc.new_order_step_documents,                               // index 5 (خطوة 6)
      context.loc.new_order_step_review,                                // index 6 (خطوة 7)
    ];

    // معادلة حساب بداية المجموعة (visibleStart):
    // عند الخطوات (0, 1, 2) -> البداية 0 (تعرض 1, 2, 3)
    // عند الخطوات (3, 4)    -> البداية 2 (تعرض 3✓, 4, 5)
    // عند الخطوات (5, 6)    -> البداية 4 (تعرض 5✓, 6, 7)
    final int visibleStart;
    if (currentStep < 3) {
      visibleStart = 0;
    } else if (currentStep < 5) {
      visibleStart = 2;
    } else {
      visibleStart = 4;
    }

    final visibleCount = (labels.length - visibleStart).clamp(1, 3);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. خط البداية (لا يظهر في الصفحة الأولى، ويظهر كخط مكتمل عند الانتقال للمجموعات التالية)
        if (visibleStart > 0)
          Expanded(
            child: _EdgeConnector(complete: true),
          )
        else
          const SizedBox.shrink(),

        for (var i = 0; i < visibleCount; i++) ...[
          ...() {
            final actualIndex = visibleStart + i;
            final isStepActive = actualIndex == currentStep;
            final isStepComplete = actualIndex < currentStep;

            return [
              _StepNode(
                number: actualIndex + 1,
                label: labels[actualIndex],
                active: isStepActive,
                complete: isStepComplete,
              ),
              if (i < visibleCount - 1)
                Expanded(
                  child: _StepConnector(
                    startComplete: currentStep >= actualIndex,
                    endComplete: currentStep > actualIndex,
                  ),
                ),
            ];
          }(),
        ],

        // 2. خط النهاية (يظهر طالما يوجد خطوات متبقية بعد المجموعة الحالية)
        if (visibleStart + visibleCount < labels.length)
          Expanded(
            child: _EdgeConnector(
              complete: currentStep >= visibleStart + visibleCount - 1,
            ),
          )
        else
          const SizedBox.shrink(),
      ],
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
      padding: EdgeInsets.only(top: AppPaddingHeight.p19),
      child: Row(
        children: [
          Expanded(child: _ConnectorLine(complete: startComplete)),
          SizedBox(
            width: AppWidth.w10,
            height: AppHeight.h10,
            child: Transform.rotate(
              angle: 0.785,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: endComplete
                          ? AppColors.secondary
                          : AppColors.lightActive,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: startComplete
                          ? AppColors.secondary
                          : AppColors.lightActive,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: _ConnectorLine(complete: endComplete)),
        ],
      ),
    );
  }
}

class _EdgeConnector extends StatelessWidget {
  const _EdgeConnector({required this.complete});

  final bool complete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppPaddingHeight.p23),
      child: _ConnectorLine(complete: complete),
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