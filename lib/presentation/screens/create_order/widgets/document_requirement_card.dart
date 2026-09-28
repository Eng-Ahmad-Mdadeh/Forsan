import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class DocumentRequirementCard extends StatelessWidget {
  const DocumentRequirementCard({
    super.key,
    required this.title,
    required this.availability,
    required this.icon,
    required this.onTap,
    this.isLoading = false,
  });

  final String title;
  final String availability;
  final IconData icon;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      onTap: onTap,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p18,
      ),
      borderRadius: BorderRadius.circular(AppRadius.r8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryDark, size: AppSize.s18),
          SizedBox(width: AppWidth.w4),
          Expanded(
            child: SectionTitle(
              text: title,
              color: AppColors.primaryDark,
              fontSize: AppFontSize.s14,
              fontWeight: AppFontWeight.regular,
              maxLines: 1,
            ),
          ),
          SizedBox(width: AppWidth.w12),
          if (isLoading) ...[
            SizedBox(
              width: AppSize.s18,
              height: AppSize.s18,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              ),
            ),
            SizedBox(width: AppWidth.w8),
          ],
          BodyTitle(
            text: availability,
            color: AppColors.secondary,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
