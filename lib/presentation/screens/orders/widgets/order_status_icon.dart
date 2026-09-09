import 'package:flutter/material.dart';

import '../../../../core/resources/app_values.dart';
import '../models/order_item.dart';

class OrderStatusIcon extends StatelessWidget {
  const OrderStatusIcon({super.key, required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) => Container(
    width: AppWidth.w38,
    height: AppWidth.w38,
    decoration: BoxDecoration(
      color: status.backgroundColor,
      shape: BoxShape.circle,
    ),
    child: Icon(status.icon, color: status.color, size: AppSize.s25),
  );
}
