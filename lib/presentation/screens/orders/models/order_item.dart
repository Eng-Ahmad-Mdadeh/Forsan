import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';

enum OrderStatus {
  waitingDocuments,
  underReview,
  inProgress,
  completed;

  String get label => switch (this) {
    waitingDocuments => 'بانتظار المستندات',
    underReview => 'قيد المراجعة',
    inProgress => 'قيد التنفيذ',
    completed => 'مكتمل',
  };

  Color get color => switch (this) {
    waitingDocuments => AppColors.secondary,
    underReview => AppColors.orange,
    inProgress => AppColors.primary,
    completed => AppColors.darkGreen,
  };

  Color get backgroundColor => switch (this) {
    waitingDocuments => AppColors.secondaryLight,
    underReview => AppColors.lightOrange,
    inProgress => AppColors.lightPrimary,
    completed => AppColors.lightGreen,
  };

  IconData get icon => switch (this) {
    waitingDocuments => Icons.create_new_folder_outlined,
    underReview => Icons.access_time_rounded,
    inProgress => Icons.settings_outlined,
    completed => Icons.check_circle_outline_rounded,
  };
}

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
  final OrderStatus status;
}
