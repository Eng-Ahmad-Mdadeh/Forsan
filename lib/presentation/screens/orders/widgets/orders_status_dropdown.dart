import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../data/models/order_list/order_list_model.dart';
import '../../../widgets/custom_drop_down_widget.dart';

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

    return CustomDropDownWidget(
      key: ValueKey(
        Object.hashAll([...countEntries.entries, safeSelectedIndex]),
      ),
      items: items,
      isStringList: true,
      initialItem: items[safeSelectedIndex],
      hintText: countEntries.keys.first,
      height: AppHeight.h42,
      color: AppColors.white,
      borderRadius: AppRadius.r14,
      closedBorder: Border.all(color: AppColors.greyDivider),
      onChanged: (selectedItem) {
        if (selectedItem is! String) return;
        final index = items.indexOf(selectedItem);
        if (index >= 0) onSelected(index, countEntries.keys.elementAt(index));
      },
    );
  }
}
