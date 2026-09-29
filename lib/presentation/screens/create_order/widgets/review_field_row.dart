import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

typedef ReviewField = ({String label, String value});

class ReviewFieldRow extends StatelessWidget {
  const ReviewFieldRow({super.key, required this.field});

  final ReviewField field;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BodyTitle(
            text: field.label,
            color: AppColors.blackCow,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.regular,
            maxLines: 3,
          ),
        ),
        SizedBox(width: AppWidth.w16),
        Flexible(
          child: BodyTitle(
            text: field.value,
            textAlign: TextAlign.end,
            color: AppColors.mainText,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.bold,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
