import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';

class CreateOrderAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CreateOrderAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(AppHeight.h98);


  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: context.loc.create_order_title,
      backgroundColor: AppColors.white,
      toolbarHeight: preferredSize.height,
      showBackButton: true,
      showScrolledUnderElevation: false,
      customActions: [
        Semantics(
          button: true,
          label: context.loc.notifications,
          child: InkWell(
            onTap: () {},
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
        ),
      ],
    );
  }
}
