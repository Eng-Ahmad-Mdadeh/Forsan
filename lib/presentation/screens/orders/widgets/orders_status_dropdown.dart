import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../data/models/order_list/order_list_model.dart';

class OrdersStatusDropdown extends StatelessWidget {
  const OrdersStatusDropdown({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    required this.counts,
  });

  final int selectedIndex;
  final void Function(int index, String status) onSelected;
  final Counts? counts;

  @override
  Widget build(BuildContext context) {
    final backendCounts = counts?.values;
    final countEntries = backendCounts == null || backendCounts.isEmpty
        ? const <String, int>{'all': 0}
        : backendCounts;

    final items = countEntries.entries
        .map((entry) => '${entry.key} (${entry.value})')
        .toList(growable: false);
    final safeSelectedIndex = selectedIndex >= 0 && selectedIndex < items.length
        ? selectedIndex
        : 0;

    return Container(
      height: AppHeight.h42,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: AppPaddingWidth.p10,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.greyDivider),
        borderRadius: BorderRadius.circular(AppRadius.r14),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: safeSelectedIndex,
          isExpanded: true,
          borderRadius: BorderRadius.circular(AppRadius.r14),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.mainText,
          ),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.lightBlack,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.bold,
          ),
          items: List.generate(
            items.length,
            (index) => DropdownMenuItem<int>(
              value: index,
              child: Text(
                items[index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          onChanged: (index) {
            if (index == null) return;
            onSelected(index, countEntries.keys.elementAt(index));
          },
        ),
      ),
    );
  }
}
