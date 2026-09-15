import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/presentation/screens/pay/widgets/payment_plan_card.dart';
import 'package:forsan/presentation/screens/pay/widgets/payment_methods_section.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'الدفع والتحويل',
        showBackButton: true,
        backgroundColor: AppColors.white,
        showScrolledUnderElevation: false,
        toolbarHeight: AppHeight.h70,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppPaddingWidth.p16,
          end: AppPaddingWidth.p16,
          bottom: AppPaddingHeight.p16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PaymentPlanCard(
                totalAmount: '10000',
                firstPaymentAmount: '5000',
                secondPaymentAmount: '5000',
              ),
              SizedBox(height: AppHeight.h24),
              PaymentMethodsSection(
                onBankTransferTap: () => const BankTransferRoute().push(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
