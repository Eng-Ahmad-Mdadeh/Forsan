import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class ReviewCardHeader extends StatelessWidget {
  const ReviewCardHeader({
    super.key,
    required this.title,
    required this.icon,
    this.onEdit,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppWidth.w30,
          height: AppHeight.h30,
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            borderRadius: BorderRadius.circular(AppRadius.r8),
          ),
          child: Icon(icon, color: AppColors.secondary, size: AppSize.s22),
        ),
        SizedBox(width: AppWidth.w4),
        Expanded(
          child: SectionTitle(
            text: title,
            color: AppColors.mainText,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.bold,
            maxLines: 1,
          ),
        ),
        if (onEdit != null)
          Semantics(
            button: true,
            child: InkResponse(
              key: ValueKey('review_section_edit_$title'),
              onTap: onEdit,
              radius: AppRadius.r20,
              child: SizedBox(
                width: AppWidth.w30,
                height: AppHeight.h30,
                child: Icon(
                  Iconsax.edit_2_outline,
                  color: AppColors.primary,
                  size: AppSize.s18,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
