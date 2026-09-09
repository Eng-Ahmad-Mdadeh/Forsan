import 'package:flutter/material.dart';

import '../../../core/extension/localization_extension.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/text/section_title.dart';
import '../orders/models/order_item.dart';
import '../orders/widgets/order_card.dart';
import 'widgets/order_stages_card.dart';
import 'widgets/order_summary_card.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({super.key, required this.order});

  final OrderItem order;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppBar(
      title: context.loc.order_details,
      toolbarHeight: AppHeight.h70,
      titleWidget: SectionTitle(
        text: context.loc.order_details,
        color: AppColors.mainText,
        fontSize: AppFontSize.s20,
        fontWeight: AppFontWeight.bold,
      ),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          AppPaddingWidth.p16,
          AppPaddingHeight.p16,
          AppPaddingWidth.p16,
          AppPaddingHeight.p20,
        ),
        child: Column(
          children: [
            OrderCard(order: order),
            SizedBox(height: AppHeight.h16),
            OrderSummaryCard(
              order: order,
              submittedBy: context.loc.order_submitter_abroad,
              service: context.loc.order_business_establishment,
              fees: context.loc.order_fees_after_review,
            ),
            SizedBox(height: AppHeight.h16),
            const OrderStagesCard(),
          ],
        ),
      ),
    ),
  );
}
