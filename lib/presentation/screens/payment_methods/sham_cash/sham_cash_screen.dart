import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/sham_cash/sham_cash_cubit.dart';
import 'package:forsan/presentation/screens/payment_methods/sham_cash/widgets/sham_cash_card.dart';
import 'package:forsan/presentation/screens/payment_methods/sham_cash/widgets/sham_cash_form.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';

class ShamCashScreen extends StatelessWidget {
  const ShamCashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShamCashCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
          title: context.loc.pay_sham_cash,
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
          child: Column(
            children: [
              ShamCashCard(
                instruction: context.loc.sham_cash_transfer_instruction,
                accountNumber: '268464615284455',
              ),
              SizedBox(height: AppHeight.h24),
              const ShamCashForm(),
              SizedBox(height: AppHeight.h220),
              CustomSubmitButton(
                key: const Key('sham_cash_submit_button'),
                text: 'ارسال الطلب',
                useGradient: false,
                icon: Icons.send_outlined,
                onPressed: () => (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
