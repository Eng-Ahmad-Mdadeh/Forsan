import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_fonts.dart';
import '../../core/resources/app_values.dart';
import 'custom_search.dart';

/// The search and filter controls used at the top of the orders list.
class OrdersSearchBar extends StatelessWidget {
  const OrdersSearchBar({
    super.key,
    this.controller,
    this.onSearchChanged,
    required this.onFilterPressed,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback onFilterPressed;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: CustomSearch(
          controller: controller,
          onChanged: onSearchChanged,
          color: AppColors.white,
          hintText: 'ابحث برقم الطلب أو اسم الخدمة',
          hintColor: AppColors.grey,
          borderRadius: AppRadius.r10,
        ),
      ),
      SizedBox(width: AppWidth.w10),
      Semantics(
        button: true,
        label: 'تصفية الطلبات',
        child: SizedBox(
          width: AppWidth.w52,
          height: AppHeight.h50,
          child: Material(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r10),
              side: const BorderSide(color: AppColors.greyDivider, width: 0.7),
            ),
            child: InkWell(
              onTap: onFilterPressed,
              borderRadius: BorderRadius.circular(AppRadius.r10),
              child: Icon(
                Iconsax.setting_4_outline,
                color: AppColors.primary,
                size: AppSize.s27,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
