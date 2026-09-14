import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/section_card.dart';
import '../../../widgets/status_badge.dart';
import '../models/invoice_item.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({super.key, required this.invoice});

  final InvoiceItem invoice;

  @override
  Widget build(BuildContext context) => SectionCard(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.symmetric(
      horizontal: AppPaddingWidth.p16,
      vertical: AppPaddingHeight.p16,
    ),
    borderRadius: BorderRadius.circular(AppRadius.r10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    invoice.number,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: AppColors.homeSupportAction,
                      fontFamily: AppFontFamily.tajawal,
                      fontSize: AppFontSize.s14,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                  SizedBox(height: AppHeight.h7),
                  Text(
                    invoice.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontFamily: AppFontFamily.tajawal,
                      fontSize: AppFontSize.s18,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppWidth.w10),
            StatusBadge(
              status: invoice.status,
              showIndicator: false,
              fontSize: AppFontSize.s14,
              fontWeight: AppFontWeight.bold,
            ),
          ],
        ),
        SizedBox(height: AppHeight.h25),
        Row(
          children: [
            Expanded(
              child: _InvoiceDetail(
                label: 'تاريخ الفاتورة :',
                value: invoice.invoiceDate,
              ),
            ),
            SizedBox(width: AppWidth.w10),
            Expanded(
              child: _InvoiceDetail(
                label: 'الإجمالي :',
                value: '\uFDFC ${invoice.total}',
                valueDirection: TextDirection.ltr,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _InvoiceDetail extends StatelessWidget {
  const _InvoiceDetail({
    required this.label,
    required this.value,
    this.valueDirection,
  });

  final String label;
  final String value;
  final TextDirection? valueDirection;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(
        child: Text(
          label,
          maxLines: 1,
          style: TextStyle(
            color: AppColors.greyMan,
            fontFamily: AppFontFamily.tajawal,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.regular,
          ),
        ),
      ),
      SizedBox(width: AppWidth.w7),
      Flexible(
        child: Text(
          value,
          maxLines: 1,
          textDirection: valueDirection,
          style: TextStyle(
            color: AppColors.primary,
            fontFamily: AppFontFamily.tajawal,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
