import 'package:flutter/material.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_fonts.dart';
import '../../core/resources/app_values.dart';
import 'text/body_title.dart';
import '../screens/orders/models/order_item.dart';

class StatusBadge extends StatelessWidget {
  StatusBadge({
    super.key,
    required OrderStatus status,
    this.showOuterCircle = true,
    this.fontSize,
    this.fontWeight,
  })
    : label = status.label,
      color = status.color,
      backgroundColor = status.backgroundColor;

  const StatusBadge.custom({
    super.key,
    required this.label,
    required this.color,
    required this.backgroundColor,
    this.showOuterCircle = false,
    this.fontSize,
    this.fontWeight,
  });

  final String label;
  final Color color;
  final Color backgroundColor;
  final bool showOuterCircle;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) => Container(
    constraints: BoxConstraints(minWidth: AppWidth.w110),
    padding: EdgeInsets.symmetric(
      horizontal: AppPaddingWidth.p10,
      vertical: AppPaddingHeight.p5,
    ),
    decoration: ShapeDecoration(
      color: backgroundColor,
      shape: const StadiumBorder(),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showOuterCircle)
          Container(
            width: AppWidth.w16,
            height: AppWidth.w16,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Container(
              width: AppWidth.w10,
              height: AppWidth.w10,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          )
        else
          Container(
            width: AppWidth.w10,
            height: AppWidth.w10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        SizedBox(width: AppWidth.w7),
        BodyTitle(
          text: label,
          color: color,
          fontSize: fontSize ?? AppFontSize.s12,
          fontWeight: fontWeight ?? AppFontWeight.medium,
        ),
      ],
    ),
  );
}
