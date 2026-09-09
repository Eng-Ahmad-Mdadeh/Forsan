class OrderStageItem {
  const OrderStageItem({
    required this.title,
    required this.description,
    this.date,
    this.isCompleted = false,
    this.isCurrent = false,
  });

  final String title;
  final String description;
  final String? date;
  final bool isCompleted;
  final bool isCurrent;
}
