import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';

class OrderStagesHeader extends StatelessWidget {
  const OrderStagesHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.mainText,
            fontSize: AppFontSize.s16,
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ),
      Container(
        width: AppWidth.w30,
        height: AppHeight.h30,
        decoration: BoxDecoration(
          color: AppColors.light,
          borderRadius: BorderRadius.circular(AppRadius.r8),
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.info_outline_rounded,
          size: AppWidth.w22,
          color: AppColors.secondaryText,
        ),
      ),
    ],
  );
}
