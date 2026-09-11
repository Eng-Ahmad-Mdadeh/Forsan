import 'package:flutter/material.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_fonts.dart';
import '../../core/resources/app_values.dart';
import 'text/body_title.dart';

class StatusBadge extends StatelessWidget {
  StatusBadge({
    super.key,
    required String status,
    this.showOuterCircle = true,
    this.fontSize,
    this.fontWeight,
  })
    : label = status,
      color = colorFor(status),
      backgroundColor = _backgroundColorFor(status);

  static const waitingDocuments = 'بانتظار المستندات';
  static const underReview = 'قيد المراجعة';
  static const inProgress = 'قيد التنفيذ';
  static const completed = 'مكتمل';

  static Color colorFor(String status) => switch (status) {
    waitingDocuments => AppColors.secondary,
    underReview => AppColors.orange,
    inProgress => AppColors.primary,
    completed => AppColors.darkGreen,
    _ => AppColors.greyText,
  };

  static Color _backgroundColorFor(String status) => switch (status) {
    waitingDocuments => AppColors.secondaryLight,
    underReview => AppColors.lightOrange,
    inProgress => AppColors.lightPrimary,
    completed => AppColors.lightGreen,
    _ => AppColors.lightGrey,
  };

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
