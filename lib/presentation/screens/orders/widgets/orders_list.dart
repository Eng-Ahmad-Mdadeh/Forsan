import 'package:flutter/material.dart';

import '../../../../core/resources/app_values.dart';
import '../../order_details/orders_details_screen.dart';
import '../models/order_item.dart';
import 'order_card.dart';

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
    itemBuilder: (context, index) => OrderCard(
      order: orders[index],
      onDetailsPressed: () => Navigator.of(context).push<void>(
        MaterialPageRoute<void>(
          builder: (_) => OrdersDetailsScreen(order: orders[index]),
        ),
      ),
    ),
  );
}
