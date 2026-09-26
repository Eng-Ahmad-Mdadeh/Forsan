import 'package:flutter/material.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';

import '../../../widgets/order_card.dart';

class DocumentOrderCard extends StatelessWidget {
  const DocumentOrderCard({
    super.key,
    required this.item,
    this.onDetailsPressed,
  });

  final Item item;
  final VoidCallback? onDetailsPressed;

  @override
  Widget build(BuildContext context) => OrderCard(
    item: item,
    detailsButtonText: 'تفاصيل ',
    onDetailsPressed: onDetailsPressed,
  );
}
