import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/create_order/widgets/review_card_header.dart';
import 'package:forsan/presentation/screens/create_order/widgets/review_field_row.dart';
import 'package:forsan/presentation/widgets/section_card.dart';

/// A reusable card matching the order-review design.
class ReviewSectionCard extends StatelessWidget {
  const ReviewSectionCard({
    super.key,
    required this.title,
    required this.fields,
    required this.icon,
    this.onEdit,
  });

  final String title;
  final List<ReviewField> fields;
  final IconData icon;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p16,
      ),
      borderRadius: BorderRadius.circular(AppRadius.r12),
      showShadow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ReviewCardHeader(title: title, icon: icon, onEdit: onEdit),
          SizedBox(height: AppHeight.h16),
          for (var index = 0; index < fields.length; index++) ...[
            ReviewFieldRow(field: fields[index]),
            if (index < fields.length - 1) ...[
              SizedBox(height: AppHeight.h12),
              const Divider(color: AppColors.goldBackGround, height: 1),
              SizedBox(height: AppHeight.h12),
            ],
          ],
        ],
      ),
    );
  }
}
