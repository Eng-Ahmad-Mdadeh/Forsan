import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/custom_drop_down_widget.dart';

class OrdersStatusDropdown extends StatelessWidget {
  const OrdersStatusDropdown({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    required this.counts,
  });

  static const List<String> _labels = [
    'الكل',
    'مسودة',
    'قيد المراجعة',
    'بانتظار مستندات',
    'عرض السعر جاهز',
    'بانتظار الدفع',
    'الدفع قيد المراجعة',
    'قيد التنفيذ',
    'تم التسليم',
    'مكتمل',
    'ملغي',
  ];

  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final List<int> counts;

  @override
  Widget build(BuildContext context) {
    assert(counts.isNotEmpty);
    assert(counts.length <= _labels.length);

    final items = List<String>.generate(
      counts.length,
      (index) => '${_labels[index]} (${counts[index]})',
      growable: false,
    );
    final safeSelectedIndex = selectedIndex >= 0 && selectedIndex < items.length
        ? selectedIndex
        : 0;

    return CustomDropDownWidget(
      key: ValueKey(Object.hashAll([...counts, safeSelectedIndex])),
      items: items,
      isStringList: true,
      initialItem: items[safeSelectedIndex],
      hintText: _labels.first,
      height: AppHeight.h55,
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
