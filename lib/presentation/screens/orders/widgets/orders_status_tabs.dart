import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/filter_tabs.dart';

class OrdersStatusTabs extends StatefulWidget {
  const OrdersStatusTabs({super.key, this.onSelected});

  final ValueChanged<int>? onSelected;

  @override
  State<OrdersStatusTabs> createState() => _OrdersStatusTabsState();
}

class _OrdersStatusTabsState extends State<OrdersStatusTabs> {
  int _selectedIndex = 0;

  static const _items = [
    FilterTabItem(label: 'الكل', highlightedText: '(12)'),
    FilterTabItem(
      label: 'قيد المراجعة',
      highlightedText: '(10)',
      highlightedTextColor: AppColors.blue,
    ),
    FilterTabItem(
      label: 'بانتظار مستندات',
      highlightedText: '(01)',
      highlightedTextColor: AppColors.secondary,
    ),
  ];

  @override
  Widget build(BuildContext context) => FilterTabs(
    items: _items,
    selectedIndex: _selectedIndex,
    unselectedTextColor: AppColors.mainText,
    fontWeight: AppFontWeight.medium,
    backgroundColor: Colors.transparent,
    minTabWidth: AppWidth.w98,
    showTabShadow: true,
    contentPadding: EdgeInsets.zero,
    onSelected: (index) {
      setState(() => _selectedIndex = index);
      widget.onSelected?.call(index);
    },
  );
}
