import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';

class SheetCloseButton extends StatelessWidget {
  const SheetCloseButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.r7),
      child: Container(
        width: AppWidth.w30,
        height: AppHeight.h30,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(AppRadius.r7),
        ),
        child: Icon(
          Icons.close_rounded,
          color: AppColors.primary,
          size: AppSize.s20,
        ),
      ),
    ),
  );
}
