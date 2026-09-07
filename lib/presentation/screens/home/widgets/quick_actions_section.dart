import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/text/section_title.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(
          text: 'إجراءات سريعة',
          color: AppColors.primaryDark,
          fontSize: AppFontSize.s20,
          fontWeight: AppFontWeight.bold,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: AppHeight.h16),
        Row(
          children: [
            Expanded(
              child: _QuickActionButton(
                key: const Key('new-order-action'),
                label: 'طلب جديد',
                semanticLabel: 'إنشاء طلب جديد',
                icon: Icons.add_rounded,
                color: AppColors.primary,
                onPressed: () {},
              ),
            ),
            SizedBox(width: AppWidth.w8),
            Expanded(
              child: _QuickActionButton(
                key: const Key('support-action'),
                label: 'الدعم',
                semanticLabel: 'التواصل مع الدعم',
                icon: Icons.forum_outlined,
                color: AppColors.homeSupportAction,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _QuickActionButton extends StatelessWidget {
  const _QuickActionButton({
    super.key,
    required this.label,
    required this.semanticLabel,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  final String label;
  final String semanticLabel;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: semanticLabel,
    child: CustomElevatedButton(
      height: AppHeight.h62,
      width: double.infinity,
      elevation: AppSize.s2,
      color: color,
      borderRadius: AppRadius.r16,
      padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p12),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.white, size: AppSize.s24),
          SizedBox(width: AppWidth.w8),
          Flexible(
            child: SectionTitle(
              text: label,
              color: AppColors.white,
              fontSize: AppFontSize.s16,
              fontWeight: AppFontWeight.medium,
              maxLines: 1,
            ),
          ),
        ],
      ),
    ),
  );
}
