import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class PaymentPlanCard extends StatelessWidget {
  const PaymentPlanCard({
    super.key,
    required this.totalAmount,
    required this.firstPaymentAmount,
    required this.secondPaymentAmount,
    this.currency = 'USD',
  });

  final String totalAmount;
  final String firstPaymentAmount;
  final String secondPaymentAmount;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: Container(
        width: double.infinity,
        padding: EdgeInsetsDirectional.fromSTEB(
          AppPaddingWidth.p12,
          AppPaddingHeight.p12,
          AppPaddingWidth.p12,
          AppPaddingHeight.p20,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [AppColors.profileBannerStart, AppColors.normal],
          ),
          borderRadius: BorderRadius.circular(AppRadius.r16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PaymentAmount(
              label: context.loc.pay_total_amount,
              amount: totalAmount,
              currency: currency,
            ),
            const _DashedDivider(),
            _PaymentAmount(
              label: context.loc.pay_first_payment_amount,
              amount: firstPaymentAmount,
              currency: currency,
              note: context.loc.pay_first_payment_note,
            ),
            const _DashedDivider(),
            _PaymentAmount(
              label: context.loc.pay_second_payment_amount,
              amount: secondPaymentAmount,
              currency: currency,
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentAmount extends StatelessWidget {
  const _PaymentAmount({
    required this.label,
    required this.amount,
    required this.currency,
    this.note,
  });

  final String label;
  final String amount;
  final String currency;
  final String? note;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyTitle(
          text: label,
          textAlign: TextAlign.end,
          color: AppColors.white.withOpacity(0.9),
          fontSize: AppFontSize.s14,
          fontWeight: AppFontWeight.regular,
        ),
        if (note != null) ...[
          BodyTitle(
            text: note!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            color: AppColors.secondaryNormal,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
          ),
        ],
        SizedBox(height: AppHeight.h8),
        Directionality(
          textDirection: TextDirection.ltr,
          child: SectionTitle(
            text: '$amount $currency',
            textAlign: TextAlign.end,
            color: AppColors.white,
            fontSize: AppFontSize.s20,
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(vertical: AppPaddingHeight.p12),
      child: LayoutBuilder(
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
      ),
    );
  }
}
