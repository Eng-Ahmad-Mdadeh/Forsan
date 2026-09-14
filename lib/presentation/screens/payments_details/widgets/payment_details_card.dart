import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class PaymentDetailsCard extends StatelessWidget {
  const PaymentDetailsCard({
    super.key,
    required this.invoiceNumber,
    required this.service,
    required this.serviceType,
    required this.date,
    required this.amount,
  });

  final String invoiceNumber;
  final String service;
  final String serviceType;
  final String date;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SectionCard(
        showBorder: true,
        margin: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(AppRadius.r8),
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: AppPaddingWidth.p16,
          vertical: AppPaddingHeight.p16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppHeight.h12,
          children: [
            const _PaymentDetailsHeader(),
            _PaymentDetailRow(
              icon: Icons.tag_outlined,
              label: 'رقم الفاتورة',
              value: invoiceNumber,
              valueDirection: TextDirection.ltr,
            ),
            _PaymentDetailRow(
              icon: Icons.work_outline_rounded,
              label: 'الخدمة',
              value: service,
            ),
            _PaymentDetailRow(
              icon: Icons.grid_view_rounded,
              label: 'نوع الخدمة',
              value: serviceType,
            ),
            _PaymentDetailRow(
              icon: Icons.calendar_month_outlined,
              label: 'التاريخ',
              value: date,
              valueDirection: TextDirection.ltr,
            ),
            _PaymentDetailRow(
              icon: Icons.payments_outlined,
              label: 'المبلغ',
              value: '$amount ل.س',
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentDetailsHeader extends StatelessWidget {
  const _PaymentDetailsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppWidth.w33,
          height: AppHeight.h33,
          decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.circular(AppRadius.r10),
          ),
          child: Icon(
            Icons.folder_open,
            color: AppColors.primaryDark,
            size: AppSize.s20,
          ),
        ),
        SizedBox(width: AppWidth.w8),
        SectionTitle(
          text: 'تفاصيل العملية',
          color: AppColors.primaryDark,
          fontSize: AppFontSize.s16,
          fontWeight: AppFontWeight.bold,
        ),
      ],
    );
  }
}

class _PaymentDetailRow extends StatelessWidget {
  const _PaymentDetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueDirection,
  });

  final IconData icon;
  final String label;
  final String value;
  final TextDirection? valueDirection;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: AppHeight.h48),
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: AppPaddingWidth.p8,
        vertical: AppPaddingHeight.p13,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGreySec.withOpacity(0.7),
        borderRadius: BorderRadius.circular(AppRadius.r8),
        border: Border(
          right: BorderSide(
              color: AppColors.greyDivider.withOpacity(0.2)
          ),
          left: BorderSide(
              color: AppColors.greyDivider.withOpacity(0.2)
          ),
          bottom: BorderSide(
              color: AppColors.greyDivider.withOpacity(0.2)
          ),
        )
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: AppSize.s16),
          SizedBox(width: AppWidth.w4),
          BodyTitle(
            text: label,
            color: AppColors.black,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.regular,
          ),
          SizedBox(width: AppWidth.w10),
          Expanded(
            child: Text(
              value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              textDirection: valueDirection,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontFamily: AppFontFamily.tajawal,
                fontSize: AppFontSize.s14,
                fontWeight: AppFontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
