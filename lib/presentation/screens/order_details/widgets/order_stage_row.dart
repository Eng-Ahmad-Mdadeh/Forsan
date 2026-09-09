import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import 'order_stage_item.dart';

class OrderStageRow extends StatelessWidget {
  const OrderStageRow({
    super.key,
    required this.stage,
    required this.isFirst,
    required this.isLast,
  });

  final OrderStageItem stage;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: AppWidth.w46,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: isFirst ? AppHeight.h23 : 0,
                bottom: isLast ? null : 0,
                height: isLast ? AppHeight.h23 : null,
                child: Container(
                  width: AppWidth.w2,
                  color: AppColors.mainTextLight,
                ),
              ),
              _StageMarker(stage: stage),
            ],
          ),
        ),
        SizedBox(width: AppWidth.w8),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : AppPaddingHeight.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        stage.title,
                        style: TextStyle(
                          color: AppColors.mainText,
                          fontSize: AppFontSize.s13,
                          fontWeight: AppFontWeight.bold,
                          height: 1.35,
                        ),
                      ),
                    ),
                    if (stage.date != null) ...[
                      SizedBox(width: AppWidth.w8),
                      Text(
                        stage.date!,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: AppColors.secondaryNormal,
                          fontSize: AppFontSize.s11,
                          fontWeight: AppFontWeight.regular,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: AppHeight.h4),
                Text(
                  stage.description,
                  style: TextStyle(
                    color: AppColors.greyText,
                    fontSize: AppFontSize.s12,
                    fontWeight: AppFontWeight.regular,
                    height: 1.65,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class _StageMarker extends StatelessWidget {
  const _StageMarker({required this.stage});

  final OrderStageItem stage;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: AppWidth.w46,
    height: AppHeight.h46,
    child: DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: stage.isCurrent ? AppColors.light : AppColors.none,
      ),
      child: Center(
        child: Container(
          width: AppWidth.w28,
          height: AppHeight.h28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: stage.isCompleted
                ? AppColors.homeSupportAction
                : AppColors.mainTextLightActive,
          ),
        ),
      ),
    ),
  );
}
