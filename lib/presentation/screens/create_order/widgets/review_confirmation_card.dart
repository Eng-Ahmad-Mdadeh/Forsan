import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_check_box.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class ReviewConfirmationCard extends StatelessWidget {
  const ReviewConfirmationCard({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p8,
        vertical: AppPaddingHeight.p10,
      ),
      decoration: BoxDecoration(
        color: AppColors.light,
        borderRadius: BorderRadius.circular(AppRadius.r8),
        boxShadow: [
          BoxShadow(
            color: AppColors.light.withOpacity(0.9),
            blurRadius: AppRadius.r7,
            offset: Offset(0, AppHeight.h2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCheckBox(
            value: value,
            onChanged: (value) {
              if (value != null) onChanged(value);
            },
          ),
          SizedBox(width: AppWidth.w4),
          Expanded(
            child: BodyTitle(
              text: text,
              textAlign: TextAlign.start,
              color: AppColors.primaryDark,
              fontSize: AppFontSize.s14,
              fontWeight: AppFontWeight.regular,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
