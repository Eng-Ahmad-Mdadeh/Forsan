class OrderItem {
  const OrderItem({
    required this.title,
    required this.number,
    required this.date,
    required this.consultant,
    required this.status,
  });

  final String title;
  final String number;
  final String date;
  final String consultant;
  final String status;
}
