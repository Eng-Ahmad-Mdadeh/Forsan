import 'package:flutter/material.dart';
import 'package:forsan/data/models/document_list/document_list_model.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart' as order;

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
    item: order.Item(
      id: item.id,
      reference: item.reference,
      serviceName: item.serviceName,
      categoryName: item.categoryName,
      status: item.documentsStatus ?? item.status,
      displayStatus: item.displayStatus,
      statusLabel: item.documentsStatusLabel ?? item.statusLabel,
      progress: item.progress,
      createdAt: item.createdAt,
      consultant: item.consultant,
    ),
    detailsButtonText: 'تفاصيل ',
    onDetailsPressed: onDetailsPressed,
  );
}
