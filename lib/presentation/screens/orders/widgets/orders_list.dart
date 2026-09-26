import 'package:flutter/material.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/order_card.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({
    super.key,
    required this.orders,
    this.controller,
  });

  final List<Item> orders;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) => ListView.separated(
    controller: controller,
    padding: EdgeInsets.fromLTRB(
      AppPaddingWidth.p16,
      AppPaddingHeight.p16,
      AppPaddingWidth.p16,
      AppPaddingHeight.p20,
    ),
    itemCount: orders.length,
    separatorBuilder: (_, _) => SizedBox(height: AppHeight.h10),
    itemBuilder: (context, index) {
      final order = orders[index];
      return OrderCard(
        item: order,
        detailsButtonText: 'تفاصيل الطلب',
        onDetailsPressed: () => OrdersDetailsRoute(order.id ?? '').push(context),
      );
    },
  );

}
