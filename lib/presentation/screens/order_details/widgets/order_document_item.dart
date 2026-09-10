import 'package:flutter/material.dart';

import '../../../../core/extension/localization_extension.dart';
import '../../../../core/resources/app_colors.dart';

enum OrderDocumentStatus {
  approved(
    backgroundColor: Color(0xFFE2F6DF),
    foregroundColor: Color(0xFF70C978),
  ),
  rejected(
    backgroundColor: Color(0xFFFBE2E2),
    foregroundColor: Color(0xFFF06F75),
  ),
  underReview(
    backgroundColor: Color(0xFFE1EDF8),
    foregroundColor: Color(0xFF78B4D7),
  ),
  required(
    backgroundColor: Color(0xFFFFF7DD),
    foregroundColor: Color(0xFFF2CA55),
  ),
  notRequired(
    backgroundColor: AppColors.light,
    foregroundColor: AppColors.lightActive,
  );

  const OrderDocumentStatus({
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;

  String label(BuildContext context) => switch (this) {
    OrderDocumentStatus.approved =>
      context.loc.order_document_status_approved,
    OrderDocumentStatus.rejected =>
      context.loc.order_document_status_rejected,
    OrderDocumentStatus.underReview =>
      context.loc.order_document_status_under_review,
    OrderDocumentStatus.required =>
      context.loc.order_document_status_required,
    OrderDocumentStatus.notRequired =>
      context.loc.order_document_status_not_required,
  };
}

class OrderDocumentItem {
  const OrderDocumentItem({required this.title, required this.status});

  final String title;
  final OrderDocumentStatus status;
}
