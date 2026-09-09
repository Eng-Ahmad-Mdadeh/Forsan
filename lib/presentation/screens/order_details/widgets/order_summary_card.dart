import 'package:flutter/material.dart';

import '../../../../core/extension/localization_extension.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../orders/models/order_item.dart';
import '../../orders/widgets/order_status_badge.dart';
import 'order_summary_header.dart';
import 'order_summary_row.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
    required this.order,
    required this.submittedBy,
    required this.service,
    required this.fees,
  });

  final OrderItem order;
  final String submittedBy;
  final String service;
  final String fees;

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Semantics(
      container: true,
      label: '${context.loc.order_summary} ${order.number}',
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.r17),
          boxShadow: [
            BoxShadow(
              color: AppColors.homeSoftShadow,
              blurRadius: AppRadius.r7,
              offset: Offset(0, AppHeight.h2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.r17),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const OrderSummaryHeader(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p16),
                child: Column(
                  children: [
                    OrderSummaryRow(
                      icon: Icons.tag_rounded,
                      label: context.loc.order_number,
                      value: order.number,
                    ),
                    OrderSummaryRow(
                      icon: Icons.person_outline_rounded,
                      label: context.loc.order_submitter,
                      value: submittedBy,
                    ),
                    OrderSummaryRow(
                      icon: Icons.calendar_today_outlined,
                      label: context.loc.order_date,
                      value: order.date,
                    ),
                    OrderSummaryRow(
                      icon: Icons.radio_button_checked_rounded,
                      label: context.loc.order_status,
                      valueWidget: OrderStatusBadge(status: order.status),
                    ),
                    OrderSummaryRow(
                      icon: Icons.work_outline_rounded,
                      label: context.loc.order_service,
                      value: service,
                    ),
                    OrderSummaryRow(
                      icon: Icons.grid_view_rounded,
                      label: context.loc.order_service_type,
                      value: order.title,
                      showDivider: false,
                    ),
                    OrderSummaryRow(
                      icon: Icons.payments_outlined,
                      label: context.loc.order_fees,
                      value: fees,
                      showDivider: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
