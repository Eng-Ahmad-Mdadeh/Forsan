import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class ProfileInfoRow extends StatelessWidget {
  const ProfileInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.showDivider = true,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool showDivider;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: AppPaddingHeight.p12),
        child: Row(
          children: [
            Icon(icon, color: AppColors.secondaryText, size: AppSize.s16),
            SizedBox(width: AppWidth.w8),
            Expanded(
              child: BodyTitle(
                text: label,
                color: AppColors.black,
                fontSize: AppFontSize.s14,
                fontWeight: AppFontWeight.regular,
              ),
            ),
            BodyTitle(
              textAlign: TextAlign.left,
              text: value,
              color: AppColors.black,
              fontSize: AppFontSize.s14,
              fontWeight: AppFontWeight.bold,
            ),
          ],
        ),
      ),
      if (showDivider)
        Divider(
          height: AppHeight.h1,
          thickness: AppHeight.h1,
          color: AppColors.greyDivider.withValues(alpha: .35),
        ),
    ],
  );
}
