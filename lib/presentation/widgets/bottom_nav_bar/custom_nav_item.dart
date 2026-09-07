import 'package:flutter/material.dart';

import '../../../core/resources/app_colors.dart';

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
          padding: const EdgeInsets.fromLTRB(4, 14, 4, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                selected ? selectedIcon ?? icon : icon,
                color: selected ? AppColors.secondary : foregroundColor,
                size: 31,
              ),
              const SizedBox(height: 7),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                  color: foregroundColor,
                  fontSize: 16,
                  height: 1,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: selected ? 8 : 0,
                height: selected ? 8 : 0,
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
