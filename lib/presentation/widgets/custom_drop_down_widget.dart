import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';

class CustomDropDownWidget extends StatelessWidget {
  final ValueChanged<dynamic> onChanged;
  final String hintText;
  final String? searchHintText;
  final List<dynamic>? items;
  final Widget? prefixIcon;
  final bool isStringList;
  final bool multiSelect;
  final BoxBorder? closedBorder;

  final double? height;
  final double? startPadding;
  final double? endPadding;
  final double? topPadding;
  final double? bottomPadding;
  final double? borderRadius;
  final Color? color;
  final Color? textColor;
  final SingleSelectController<dynamic>? controller;
  final dynamic initialItem;

  const CustomDropDownWidget({
    super.key,
    required this.onChanged,
    required this.hintText,
    required this.items,
    this.isStringList = false,
    this.multiSelect = false,
    this.closedBorder,
    this.prefixIcon,
    this.height,
    this.startPadding,
    this.endPadding,
    this.topPadding,
    this.bottomPadding,
    this.borderRadius,
    this.color,
    this.textColor,
    this.searchHintText,
    this.controller,
    this.initialItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? AppHeight.h55,
      child: multiSelect
          ? Theme(
              data: ThemeData(),

              child: CustomDropdown<dynamic>.multiSelectSearch(
                searchHintText: searchHintText,
                onListChanged: onChanged,
                closedHeaderPadding: EdgeInsets.only(
                  right: startPadding ?? AppPaddingWidth.p10,
                  left: endPadding ?? AppPaddingWidth.p10,
                  bottom: bottomPadding ?? AppPaddingHeight.p12,
                  top: topPadding ?? AppPaddingHeight.p11,
                ),
                decoration: CustomDropdownDecoration(
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.grey, fontWeight: AppFontWeight.regular,fontSize:AppSize.s16),
                  listItemStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.blackCow,
                    fontSize: AppFontSize.s14,
                    fontWeight: AppFontWeight.bold,
                  ),
                  headerStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.lightBlack,
                    fontSize: AppFontSize.s14,
                    fontWeight: AppFontWeight.bold,
                  ),
                  closedBorder: Border.all(color: AppColors.lightGrey),
                  expandedBorder: Border.all(color: AppColors.lightGrey),

                  closedFillColor: color ?? AppColors.white,
                  prefixIcon: prefixIcon,
                  closedBorderRadius: BorderRadius.circular(borderRadius ?? AppRadius.r7),
                  expandedBorderRadius: BorderRadius.circular(AppRadius.r7),
                ),
                items: isStringList ? items : items!.map((e) => e.name!).toList(),
                hintText: hintText,
              ),
            )
          : Theme(
              data: ThemeData(),
              child: CustomDropdown<dynamic>(
                controller: controller,
                // searchHintText: searchHintText,
                onChanged: onChanged,
                initialItem: initialItem,
                closedHeaderPadding: EdgeInsets.only(
                  right: startPadding ?? AppPaddingWidth.p10,
                  left: endPadding ?? AppPaddingWidth.p10,
                  bottom: bottomPadding ?? AppPaddingHeight.p12,
                  top: topPadding ?? AppPaddingHeight.p12,
                ),
                decoration: CustomDropdownDecoration(
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.grey, fontWeight: AppFontWeight.regular),
                  listItemStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.blackCow,
                    fontSize: AppFontSize.s14,
                    fontWeight: AppFontWeight.bold,
                  ),
                  headerStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(

                    color: textColor ?? AppColors.lightBlack,
                    fontSize: AppFontSize.s14,
                    fontWeight: AppFontWeight.bold,
                  ),
                  closedBorder: closedBorder ?? Border.all(color: AppColors.lightGrey),
                  expandedBorder: Border.all(color: AppColors.lightGrey),

                  closedFillColor: color ?? AppColors.white,
                  prefixIcon: prefixIcon,
                  closedBorderRadius: BorderRadius.circular(borderRadius ?? AppRadius.r7),
                  expandedBorderRadius: BorderRadius.circular(AppRadius.r7),
                ),
                items: isStringList ? items : items!.map((e) => e.name!).toList(),
                hintText: hintText,
              ),
            ),
    );
  }
}
