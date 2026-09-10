import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';

enum DocumentDetailsState {
  underReview,
  waitingDocuments,
  inProgress,
  completed,
}

class DocumentDetailsData {
  const DocumentDetailsData({required this.name, required this.size});

  final String name;
  final String size;
}

enum DocumentDetailsStatus {
  approved('معتمد', AppColors.lightGreen, AppColors.darkGreen),
  rejected('مرفوض', AppColors.lightRed, AppColors.red),
  required('مطلوب', AppColors.secondaryLightHover, AppColors.secondaryNormal),
  underReview('قيد المراجعة', AppColors.blueText, AppColors.blue);

  const DocumentDetailsStatus(
    this.label,
    this.backgroundColor,
    this.foregroundColor,
  );

  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
}
