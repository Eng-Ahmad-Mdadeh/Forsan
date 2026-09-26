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
    this.draftCount = 0,
    this.underReviewCount = 0,
    this.awaitingDocumentsCount = 0,
    this.quoteReadyCount = 0,
    this.awaitingPaymentCount = 0,
    this.paymentUnderReviewCount = 0,
    this.inProgressCount = 0,
    this.deliveredCount = 0,
    this.completedCount = 0,
    this.cancelledCount = 0,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final int allCount;
  final int draftCount;
  final int underReviewCount;
  final int awaitingDocumentsCount;
  final int quoteReadyCount;
  final int awaitingPaymentCount;
  final int paymentUnderReviewCount;
  final int inProgressCount;
  final int deliveredCount;
  final int completedCount;
  final int cancelledCount;

  @override
  Widget build(BuildContext context) => FilterTabs(
    items: [
      FilterTabItem(label: 'الكل', highlightedText: '($allCount)'),
      FilterTabItem(label: 'مسودة', highlightedText: '($draftCount)'),
      FilterTabItem(
        label: 'قيد المراجعة',
        highlightedText: '($underReviewCount)',
        highlightedTextColor: AppColors.blue,
      ),
      FilterTabItem(
        label: 'بانتظار مستندات',
        highlightedText: '($awaitingDocumentsCount)',
        highlightedTextColor: AppColors.secondary,
      ),
      FilterTabItem(
        label: 'عرض السعر جاهز',
        highlightedText: '($quoteReadyCount)',
      ),
      FilterTabItem(
        label: 'بانتظار الدفع',
        highlightedText: '($awaitingPaymentCount)',
      ),
      FilterTabItem(
        label: 'الدفع قيد المراجعة',
        highlightedText: '($paymentUnderReviewCount)',
      ),
      FilterTabItem(label: 'قيد التنفيذ', highlightedText: '($inProgressCount)'),
      FilterTabItem(label: 'تم التسليم', highlightedText: '($deliveredCount)'),
      FilterTabItem(label: 'مكتمل', highlightedText: '($completedCount)'),
      FilterTabItem(label: 'ملغي', highlightedText: '($cancelledCount)'),
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
