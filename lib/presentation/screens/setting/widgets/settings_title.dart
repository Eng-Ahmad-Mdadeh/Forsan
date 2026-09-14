import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class SettingsTitle extends StatelessWidget {
  const SettingsTitle({
    super.key,
    required this.title,
    this.color = AppColors.mainText,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) => Align(
    alignment: AlignmentDirectional.centerStart,
    child: BodyTitle(
      text: title,
      color: color,
      fontSize: AppFontSize.s18,
      fontWeight: AppFontWeight.regular,
    ),
  );
}
