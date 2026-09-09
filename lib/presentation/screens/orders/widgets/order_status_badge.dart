import 'package:flutter/material.dart';

import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/text/body_title.dart';
import '../models/order_item.dart';

class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({super.key, required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) => Container(
    constraints: BoxConstraints(minWidth: AppWidth.w110),
    padding: EdgeInsets.symmetric(
      horizontal: AppPaddingWidth.p10,
      vertical: AppPaddingHeight.p5,
    ),
    decoration: ShapeDecoration(
      color: status.backgroundColor,
      shape: const StadiumBorder(),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BodyTitle(
          text: status.label,
          color: status.color,
          fontSize: AppFontSize.s12,
          fontWeight: AppFontWeight.medium,
        ),
        SizedBox(width: AppWidth.w7),
        Container(
          width: AppWidth.w6,
          height: AppWidth.w6,
          decoration: BoxDecoration(color: status.color, shape: BoxShape.circle),
        ),
      ],
    ),
  );
}
