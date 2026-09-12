import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class FilterTabs extends StatelessWidget {
  const FilterTabs({
    super.key,
    required this.items,
    this.selectedIndex = 0,
    this.onSelected,
    this.unselectedTextColor = AppColors.secondary,
    this.fontWeight = AppFontWeight.bold,
    this.backgroundColor = AppColors.greyButton,
    this.minTabWidth,
    this.showTabShadow = false,
    this.showTapOverlay = true,
    this.contentPadding,
  });

  final List<FilterTabItem> items;
  final int selectedIndex;
  final ValueChanged<int>? onSelected;
  final Color unselectedTextColor;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final double? minTabWidth;
  final bool showTabShadow;
  final bool showTapOverlay;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h60,
      padding: EdgeInsetsDirectional.only(top: AppPaddingHeight.p6, bottom: AppPaddingHeight.p6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.r14),
      ),
      child: ListView.separated(
        padding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: AppPaddingWidth.p7),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(width: AppWidth.w6),
        itemBuilder: (context, index) => _FilterTab(
          item: items[index],
          selected: index == selectedIndex,
          unselectedTextColor: unselectedTextColor,
          fontWeight: fontWeight,
          minWidth: minTabWidth,
          showShadow: showTabShadow,
          showTapOverlay: showTapOverlay,
          onTap: onSelected == null ? null : () => onSelected!(index),
        ),
      ),
    );
  }
}

/// The content displayed by a [FilterTabs] tab.
class FilterTabItem {
  const FilterTabItem({
    required this.label,
    this.icon,
    this.highlightedText,
    this.highlightedTextColor,
  });

  final String label;
  final IconData? icon;
  final String? highlightedText;
  final Color? highlightedTextColor;
}

class _FilterTab extends StatelessWidget {
  const _FilterTab({
    required this.item,
    required this.selected,
    required this.unselectedTextColor,
    required this.fontWeight,
    required this.minWidth,
    required this.showShadow,
    required this.showTapOverlay,
    this.onTap,
  });

  final FilterTabItem item;
  final bool selected;
  final Color unselectedTextColor;
  final FontWeight fontWeight;
  final double? minWidth;
  final bool showShadow;
  final bool showTapOverlay;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(AppRadius.r12);

    return Container(
      constraints: BoxConstraints(
        maxWidth: AppWidth.w200,
        minWidth: minWidth ?? AppWidth.w115,
      ),
      height: AppHeight.h50,
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppPaddingWidth.p13),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : AppColors.white,
        borderRadius: borderRadius,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: AppColors.homeSoftShadow,
                  blurRadius: AppRadius.r10,
                  offset: Offset(0, AppHeight.h3),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          overlayColor: showTapOverlay
              ? null
              : const WidgetStatePropertyAll(Colors.transparent),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AppWidth.w7,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (item.icon case final icon?)
                Icon(icon, size: AppSize.s20, color: selected ? AppColors.white : AppColors.grey),
              Flexible(
                child: _TabLabel(
                  item: item,
                  selected: selected,
                  color: unselectedTextColor,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabLabel extends StatelessWidget {
  const _TabLabel({
    required this.item,
    required this.selected,
    required this.color,
    required this.fontWeight,
  });

  final FilterTabItem item;
  final bool selected;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    final textColor = selected ? AppColors.white : color;
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: textColor,
      fontSize: AppFontSize.s14,
      fontWeight: fontWeight,
    );

    if (item.highlightedText == null) {
      return BodyTitle(
        text: item.label,
        color: textColor,
        fontSize: AppFontSize.s14,
        fontWeight: fontWeight,
      );
    }

    return Text.rich(
      TextSpan(
        text: item.label,
        children: [
          TextSpan(
            text: ' ${item.highlightedText}',
            style: style?.copyWith(
              color: selected
                  ? AppColors.white
                  : item.highlightedTextColor ?? textColor,
            ),
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
