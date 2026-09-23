import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/filter_tabs.dart';

class OrdersStatusTabs extends StatelessWidget {
  const OrdersStatusTabs({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    this.allCount = 0,
    this.underReviewCount = 0,
    this.waitingDocumentsCount = 0,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final int allCount;
  final int underReviewCount;
  final int waitingDocumentsCount;

  @override
  Widget build(BuildContext context) => FilterTabs(
    items: [
      FilterTabItem(label: 'الكل', highlightedText: '($allCount)'),
      FilterTabItem(
        label: 'قيد المراجعة',
        highlightedText: '($underReviewCount)',
        highlightedTextColor: AppColors.blue,
      ),
      FilterTabItem(
        label: 'بانتظار مستندات',
        highlightedText: '($waitingDocumentsCount)',
        highlightedTextColor: AppColors.secondary,
      ),
    ],
    selectedIndex: selectedIndex,
    unselectedTextColor: AppColors.mainText,
    fontWeight: AppFontWeight.medium,
    backgroundColor: Colors.transparent,
    minTabWidth: AppWidth.w90,
    showTabShadow: false,
    showTapOverlay: false,
    contentPadding: EdgeInsets.zero,
    onSelected: onSelected,
  );
}
