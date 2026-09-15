import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/payment_methods/bank_transfer/widgets/bank_transfer_card.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';

class BankTransferScreen extends StatelessWidget {
  const BankTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: context.loc.pay_bank_transfer,
        showBackButton: true,
        backgroundColor: AppColors.white,
        showScrolledUnderElevation: false,
        toolbarHeight: AppHeight.h70,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.fromSTEB(
          AppPaddingWidth.p16,
          AppPaddingHeight.p12,
          AppPaddingWidth.p16,
          AppPaddingHeight.p24,
        ),
        child: BankTransferCard(
          bankLabel: context.loc.bank_name,
          bankName: 'بنك بيمو السعودي الفرنسي',
          beneficiaryLabel: context.loc.beneficiary_name,
          beneficiaryName: 'فرسان للأعمال',
          accountNumberLabel: context.loc.account_number,
          accountNumber: '268464615284455',
          ibanLabel: context.loc.iban_number,
          iban: 'SA265 651651 61516 6161',
        ),
      ),
    );
  }
}
