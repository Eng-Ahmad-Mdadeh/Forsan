import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class OrderSectionHeader extends StatelessWidget {
  const OrderSectionHeader({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    this.descriptionMaxLines = 3,
  });

  final IconData icon;
  final String title;
  final String? description;
  final int descriptionMaxLines;

  @override
  Widget build(BuildContext context) {
    final trimmedTitle = title.trim();
    final trimmedDescription = description?.trim() ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (trimmedTitle.isNotEmpty) ...[
          Row(
            children: [
              Icon(icon, size: AppSize.s16, color: AppColors.secondary),
              SizedBox(width: AppWidth.w4),
              Expanded(
                child: SectionTitle(
                  text: trimmedTitle,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h8),
        ],
        if (trimmedDescription.isNotEmpty) ...[
          BodyTitle(
            text: trimmedDescription,
            color: AppColors.secondaryText,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
            maxLines: descriptionMaxLines,
          ),
          SizedBox(height: AppHeight.h8),
        ],
      ],
    );
  }
}
