import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/filter_tabs.dart';

class OrdersStatusDropdown extends StatelessWidget {
  const OrdersStatusDropdown({
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
  Widget build(BuildContext context) {
    final items = [
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
    ];

    return Container(
      height: AppHeight.h55,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: AppPaddingWidth.p13,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.greyDivider),
        borderRadius: BorderRadius.circular(AppRadius.r14),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: selectedIndex,
          isExpanded: true,
          borderRadius: BorderRadius.circular(AppRadius.r14),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.mainText,
          ),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.mainText,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.medium,
          ),
          items: List.generate(
            items.length,
            (index) => DropdownMenuItem<int>(
              value: index,
              child: _StatusLabel(item: items[index]),
            ),
          ),
          onChanged: (index) {
            if (index != null) onSelected(index);
          },
        ),
      ),
    );
  }
}

class _StatusLabel extends StatelessWidget {
  const _StatusLabel({required this.item});

  final FilterTabItem item;

  @override
  Widget build(BuildContext context) => Text.rich(
    TextSpan(
      text: item.label,
      children: [
        if (item.highlightedText case final highlightedText?)
          TextSpan(
            text: ' $highlightedText',
            style: TextStyle(
              color: item.highlightedTextColor ?? AppColors.mainText,
            ),
          ),
      ],
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
