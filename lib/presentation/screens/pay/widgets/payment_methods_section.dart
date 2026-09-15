import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/pay/widgets/payment_method_card.dart';
import 'package:forsan/presentation/widgets/text/page_title.dart';

class PaymentMethodsSection extends StatelessWidget {
  const PaymentMethodsSection({
    super.key,
    this.onBankTransferTap,
    this.onWesternUnionTap,
    this.onShamCashTap,
  });

  final VoidCallback? onBankTransferTap;
  final VoidCallback? onWesternUnionTap;
  final VoidCallback? onShamCashTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PageTitle(
          text: context.loc.pay_choose_payment_method,
          textAlign: TextAlign.start,
          color: AppColors.mainText,
          fontSize: AppFontSize.s24,
          fontWeight: AppFontWeight.bold,
        ),
        SizedBox(height: AppHeight.h20),
        PaymentMethodCard(
          title: context.loc.pay_bank_transfer,
          assetPath: AppAssets.addFile,
          onTap: onBankTransferTap,
        ),
        SizedBox(height: AppHeight.h16),
        PaymentMethodCard(
          title: context.loc.pay_western_union,
          assetPath: AppAssets.addFile,
          onTap: onWesternUnionTap,
        ),
        SizedBox(height: AppHeight.h16),
        PaymentMethodCard(
          title: context.loc.pay_sham_cash,
          assetPath: AppAssets.addFile,
          onTap: onShamCashTap,
        ),
      ],
    );
  }
}
