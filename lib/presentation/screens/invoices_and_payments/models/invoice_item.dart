class InvoiceItem {
  const InvoiceItem({
    required this.number,
    required this.title,
    required this.invoiceDate,
    required this.total,
    required this.status,
  });

  final String number;
  final String title;
  final String invoiceDate;
  final String total;
  final String status;
}
