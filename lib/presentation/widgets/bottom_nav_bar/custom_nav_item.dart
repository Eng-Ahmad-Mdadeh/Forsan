import 'package:flutter/material.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';

class CustomNavItem extends StatelessWidget {
  const CustomNavItem({
    required this.onPressed,
    required this.label,
    required this.selected,
    required this.icon,
    this.selectedIcon,
    super.key,
  });

  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = selected
        ? AppColors.primary
        : AppColors.mainText;

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppPaddingWidth.p4,
            AppPaddingHeight.p14,
            AppPaddingWidth.p4,
            AppPaddingHeight.p8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                selected ? selectedIcon ?? icon : icon,
                color: selected ? AppColors.secondary : foregroundColor,
                size: AppSize.s30,
              ),
              SizedBox(height: AppHeight.h7),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                  color: foregroundColor,
                  fontFamily: AppFontFamily.tajawal,
                  fontSize: AppFontSize.s16,
                  height: 1,
                  fontWeight: selected
                      ? AppFontWeight.bold
                      : AppFontWeight.regular,
                ),
              ),
              SizedBox(height: AppHeight.h8),
              AnimatedContainer(
                duration: AppDurations.navigationSelection,
                width: selected ? AppWidth.w8 : 0,
                height: selected ? AppHeight.h8 : 0,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
