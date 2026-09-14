import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

import 'widgets/payment_summary_card.dart';

class PaymentsDetailsScreen extends StatelessWidget {
  const PaymentsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'تفاصيل الفاتورة',
        backgroundColor: AppColors.white,
        toolbarHeight: AppHeight.h70,
        showScrolledUnderElevation: false,
        showBackButton: true,
        titleSpacing: AppPaddingWidth.p16,
        titleWidget: SectionTitle(
          text: 'تفاصيل الفاتورة',
          color: AppColors.mainText,
          fontSize: AppFontSize.s18,
          fontWeight: AppFontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.fromSTEB(
            AppPaddingWidth.p16,
            AppPaddingHeight.p16,
            AppPaddingWidth.p16,
            AppPaddingHeight.p24,
          ),
          child: const PaymentSummaryCard(
            totalAmount: '40,000',
            paidAmount: '30,000',
            remainingAmount: '10,000',
          ),
        ),
      ),
    );
  }
}
