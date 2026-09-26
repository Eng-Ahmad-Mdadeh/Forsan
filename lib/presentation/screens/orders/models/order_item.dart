class OrderItem {
  const OrderItem({
    required this.title,
    required this.number,
    required this.date,
    required this.consultant,
    required this.status,
    required this.id,
  });

  final String id;
  final String title;
  final String number;
  final String date;
  final String consultant;
  final String status;
}
