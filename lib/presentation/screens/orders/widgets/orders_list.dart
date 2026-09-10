import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/resources/app_values.dart';
import '../models/order_item.dart';
import '../../../widgets/order_card.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.orders});

  final List<OrderItem> orders;

  @override
  Widget build(BuildContext context) => ListView.separated(
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
        order: order,
        onDetailsPressed: () => OrdersDetailsRoute(order).push(context),
      );
    },
  );
}
