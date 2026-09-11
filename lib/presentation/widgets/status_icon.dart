import 'package:flutter/material.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_values.dart';

class StatusIcon extends StatelessWidget {
  const StatusIcon({super.key, required this.status});

  final String status;

  Color get _backgroundColor => switch (status) {
    'بانتظار المستندات' => AppColors.secondaryLight,
    'قيد المراجعة' => AppColors.lightOrange,
    'قيد التنفيذ' => AppColors.lightPrimary,
    'مكتمل' => AppColors.lightGreen,
    _ => AppColors.lightGrey,
  };

  Color get _color => switch (status) {
    'بانتظار المستندات' => AppColors.secondary,
    'قيد المراجعة' => AppColors.orange,
    'قيد التنفيذ' => AppColors.primary,
    'مكتمل' => AppColors.darkGreen,
    _ => AppColors.greyText,
  };

  IconData get _icon => switch (status) {
    'بانتظار المستندات' => Icons.create_new_folder_outlined,
    'قيد المراجعة' => Icons.access_time_rounded,
    'قيد التنفيذ' => Icons.settings_outlined,
    'مكتمل' => Icons.check_circle_outline_rounded,
    _ => Icons.info_outline_rounded,
  };

  @override
  Widget build(BuildContext context) => Container(
    width: AppWidth.w38,
    height: AppWidth.w38,
    decoration: BoxDecoration(
      color: _backgroundColor,
      shape: BoxShape.circle,
    ),
    child: Icon(_icon, color: _color, size: AppSize.s25),
  );
}
