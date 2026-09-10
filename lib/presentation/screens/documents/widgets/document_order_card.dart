import 'package:flutter/material.dart';

import '../../orders/models/order_item.dart';
import '../../../widgets/order_card.dart';

class DocumentOrderCard extends StatelessWidget {
  const DocumentOrderCard({
    super.key,
    required this.document,
    this.onDetailsPressed,
  });

  final OrderItem document;
  final VoidCallback? onDetailsPressed;

  @override
  Widget build(BuildContext context) => OrderCard(
    order: document,
    detailsButtonText: 'تفاصيل ',
    onDetailsPressed: onDetailsPressed,
  );
}
