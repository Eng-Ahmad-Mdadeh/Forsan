import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class PaymentSummaryCard extends StatelessWidget {
  const PaymentSummaryCard({
    super.key,
    required this.totalAmount,
    required this.paidAmount,
    required this.remainingAmount,
  });

  final String totalAmount;
  final String paidAmount;
  final String remainingAmount;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      showShadow: false,
      backgroundColor: AppColors.profileBannerStart,
      backgroundGradient: const LinearGradient(
        begin: AlignmentDirectional.centerStart,
        end: AlignmentDirectional.centerEnd,
        colors: [AppColors.profileBannerEnd, AppColors.profileBannerStart],
      ),
      borderRadius: BorderRadius.circular(AppRadius.r12),
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: AppPaddingWidth.p12,
        vertical: AppPaddingHeight.p12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _AmountRow(label: 'المبلغ الإجمالي', amount: totalAmount),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppPaddingHeight.p8),
            child: const _DashedDivider(),
          ),
          _AmountRow(label: 'المبلغ المدفوع', amount: paidAmount),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppPaddingHeight.p8),
            child: const _DashedDivider(),
          ),
          _AmountRow(label: 'المبلغ المتبقي', amount: remainingAmount),
        ],
      ),
    );
  }
}

class _AmountRow extends StatelessWidget {
  const _AmountRow({required this.label, required this.amount});

  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyTitle(
          text: label,
          color: AppColors.white,
          fontSize: AppFontSize.s16,
          fontWeight: AppFontWeight.regular,
        ),
        SizedBox(height: AppHeight.h5),
        SectionTitle(
          text: '$amount ل.س',
          color: AppColors.white,
          fontSize: AppFontSize.s20,
          fontWeight: AppFontWeight.bold,
        ),
      ],
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashWidth = AppWidth.w10;
        final gapWidth = AppWidth.w8;
        final dashCount = (constraints.maxWidth / (dashWidth + gapWidth))
            .floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            dashCount,
            (_) => SizedBox(
              width: dashWidth,
              height: AppHeight.h2,
              child: ColoredBox(color: AppColors.white.withOpacity(0.08)),
            ),
          ),
        );
      },
    );
  }
}
