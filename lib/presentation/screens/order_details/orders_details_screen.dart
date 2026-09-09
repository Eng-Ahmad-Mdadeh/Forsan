import 'package:flutter/material.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/text/section_title.dart';
import '../orders/models/order_item.dart';
import '../orders/widgets/order_card.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({super.key, required this.order});

  final OrderItem order;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.white,
    appBar: CustomAppBar(
      title: 'تفاصيل الطلب',
      showBackButton: true,
      toolbarHeight: AppHeight.h70,
      showScrolledUnderElevation: false,
      backgroundColor: AppColors.white,
      titleSpacing: AppPaddingWidth.p16,
      titleWidget: SectionTitle(
        text: 'تفاصيل الطلب',
        color: AppColors.mainText,
        fontSize: AppFontSize.s24,
        fontWeight: AppFontWeight.bold,
      ),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsetsDirectional.fromSTEB(
          AppPaddingWidth.p16,
          AppPaddingHeight.p20,
          AppPaddingWidth.p16,
          AppPaddingHeight.p20,
        ),
        child: OrderCard(
          order: order,
          showFooter: false,
          showDateLabel: true,
        ),
      ),
    ),
  );
}
