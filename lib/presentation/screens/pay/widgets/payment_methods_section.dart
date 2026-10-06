import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/list_payment_methods/list_payment_methods_model.dart';
import 'package:forsan/presentation/screens/pay/widgets/payment_method_card.dart';
import 'package:forsan/presentation/widgets/text/page_title.dart';

class PaymentMethodsSection extends StatelessWidget {
  const PaymentMethodsSection({
    super.key,
    this.onBankTransferTap,
    this.onWesternUnionTap,
    this.onShamCashTap,
    this.model,
  });

  final VoidCallback? onBankTransferTap;
  final VoidCallback? onWesternUnionTap;
  final VoidCallback? onShamCashTap;
  final List<ListPaymentMethodsModel>? model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PageTitle(
          text: context.loc.pay_choose_payment_method,
          textAlign: TextAlign.start,
          color: AppColors.mainText,
          fontSize: AppFontSize.s14,
          fontWeight: AppFontWeight.bold,
        ),
        SizedBox(height: AppHeight.h7),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: model?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.only(bottom: AppPaddingHeight.p8),
              child: PaymentMethodCard(
                title:model?[index].name??'',
                assetPath: model?[index].logoUrl?? AppAssets.addFile,
                onTap: onWesternUnionTap,
              ),
            );
          },
        ),
      ],
    );
  }
}
