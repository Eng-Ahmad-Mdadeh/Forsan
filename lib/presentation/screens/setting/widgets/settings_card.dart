import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.icon,
    required this.child,
    this.color = AppColors.primary,
    this.onTap,
  });

  final IconData icon;
  final Widget child;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: AppColors.backGround,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: AppColors.lightGrey),
      borderRadius: BorderRadius.circular(AppRadius.r14),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.r14),
      child: SizedBox(
        height: AppHeight.h55,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p20),
          child: Row(
            children: [
              Icon(icon, color: color, size: AppSize.s30),
              SizedBox(width: AppWidth.w15),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    ),
  );
}
