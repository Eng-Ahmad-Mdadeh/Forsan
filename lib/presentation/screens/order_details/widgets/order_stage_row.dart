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
          width: AppWidth.w16,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: isFirst ? AppHeight.h7 : 0,
                bottom: isLast ? null : 0,
                height: isLast ? AppHeight.h7 : null,
                child: Container(
                  width: AppWidth.w1,
                  color: AppColors.mainTextLightActive,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: AppMarginHeight.m3),
                width: AppWidth.w10,
                height: AppHeight.h10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: stage.isCompleted
                      ? AppColors.homeSupportAction
                      : AppColors.mainTextLightActive,
                  boxShadow: stage.isCompleted
                      ? [
                          BoxShadow(
                            color: AppColors.lightActive,
                            blurRadius: AppRadius.r3,
                            spreadRadius: AppRadius.r2,
                          ),
                        ]
                      : null,
                ),
              ),
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
