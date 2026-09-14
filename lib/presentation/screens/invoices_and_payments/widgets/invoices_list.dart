import 'package:flutter/material.dart';

import '../../../../core/resources/app_values.dart';
import '../models/invoice_item.dart';
import 'invoice_card.dart';

class InvoicesList extends StatelessWidget {
  const InvoicesList({super.key, required this.invoices});

  final List<InvoiceItem> invoices;

  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: EdgeInsets.fromLTRB(
      AppPaddingWidth.p13,
      AppPaddingHeight.p16,
      AppPaddingWidth.p13,
      AppPaddingHeight.p20,
    ),
    itemCount: invoices.length,
    separatorBuilder: (_, _) => SizedBox(height: AppHeight.h10),
    itemBuilder: (context, index) => InvoiceCard(invoice: invoices[index]),
  );
}
