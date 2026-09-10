import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';

class CreateOrderNotificationButton extends StatelessWidget {
  const CreateOrderNotificationButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'الإشعارات',
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(AppRadius.r8),
        child: Container(
          width: AppWidth.w40,
          height: AppHeight.h40,
          decoration: BoxDecoration(
            color: AppColors.backGround,
            border: Border.all(color: AppColors.greyDivider),
            borderRadius: BorderRadius.circular(AppRadius.r8),
          ),
          child: Icon(
            Icons.notifications_none_rounded,
            color: AppColors.lightBlack,
            size: AppSize.s24,
          ),
        ),
      ),
    );
  }
}
