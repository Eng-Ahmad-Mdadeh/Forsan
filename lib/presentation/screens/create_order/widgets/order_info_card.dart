import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.light,
    this.textColor = AppColors.secondaryText,
    this.iconColor = AppColors.primaryDark,
    this.maxLines = 3,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p12,
        vertical: AppPaddingHeight.p10,
      ),
      borderRadius: BorderRadius.circular(AppRadius.r7),
      backgroundColor: backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.info_outline_rounded, color: iconColor, size: AppSize.s20),
          SizedBox(width: AppWidth.w8),
          Expanded(
            child: BodyTitle(
              text: text,
              color: textColor,
              fontSize: AppFontSize.s12,
              fontWeight: AppFontWeight.regular,
              textAlign: TextAlign.start,
              maxLines: maxLines,
            ),
          ),
        ],
      ),
    );
  }
}
