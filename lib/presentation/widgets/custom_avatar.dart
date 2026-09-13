import 'package:flutter/material.dart';
import '../../core/resources/app_colors.dart';
import '../../core/resources/app_fonts.dart';
import 'text/body_title.dart';

class CustomAvatar extends StatelessWidget {
  final String name;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData? icon;
  final double? iconSize;
  final BoxBorder? border;

  const CustomAvatar({
    super.key,
    required this.name,
    this.backgroundColor = AppColors.yellow,
    this.foregroundColor = AppColors.white,
    this.icon,
    this.iconSize,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: border,
      ),
      alignment: Alignment.center,
      child: icon != null
          ? Icon(icon, color: foregroundColor, size: iconSize)
          : BodyTitle(
              text: name.isEmpty ? '' : name[0],
              color: foregroundColor,
              fontSize: AppFontSize.s40,
              fontWeight: AppFontWeight.medium,
            ),
    );
  }
}
