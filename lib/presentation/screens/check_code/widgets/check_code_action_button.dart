import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes_imports.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class CheckCodeActionButton extends StatelessWidget {
  const CheckCodeActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.iconColor,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.r7),
      child: Container(
        height: AppHeight.h43,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.r7),
          border: Border.all(color: AppColors.lightGrey.withValues(alpha: 0.8)),
          boxShadow: [
            BoxShadow(color: AppColors.black.withValues(alpha: 0.03), blurRadius: 12, offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          spacing: AppWidth.w10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: AppSize.s22),
            BodyTitle(text: label, color: AppColors.greyText, fontSize: AppFontSize.s12),
          ],
        ),
      ),
    );
  }
}
