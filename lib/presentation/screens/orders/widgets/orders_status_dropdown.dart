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
  final ValueChanged<int> onSelected;
  final Counts? counts;

  @override
  Widget build(BuildContext context) {
    final countEntries = <String, int>{
      'all': counts?.all ?? 0,
      'DRAFT': counts?.draft ?? 0,
      'UNDER_REVIEW': counts?.underReview ?? 0,
      'AWAITING_DOCUMENTS': counts?.awaitingDocuments ?? 0,
      'QUOTE_READY': counts?.quoteReady ?? 0,
      'AWAITING_PAYMENT': counts?.awaitingPayment ?? 0,
      'PAYMENT_UNDER_REVIEW': counts?.paymentUnderReview ?? 0,
      'IN_PROGRESS': counts?.inProgress ?? 0,
      'DELIVERED': counts?.delivered ?? 0,
      'COMPLETED': counts?.completed ?? 0,
      'CANCELLED': counts?.cancelled ?? 0,
    };

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
        if (index >= 0) onSelected(index);
      },
    );
  }
}
