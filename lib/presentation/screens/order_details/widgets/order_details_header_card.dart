import 'package:flutter/material.dart';
import 'package:forsan/presentation/widgets/status_badge.dart';
import 'package:forsan/presentation/widgets/status_icon.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/section_card.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';
import '../../orders/models/order_item.dart';


class OrderDetailsHeaderCard extends StatelessWidget {
  const OrderDetailsHeaderCard({super.key, required this.order});

  final OrderItem order;

  @override
  Widget build(BuildContext context) => Semantics(
    container: true,
    label: '${order.title}، ${order.number}، ${order.status}',
    child: SectionCard(
      borderRadius:BorderRadius.circular(AppRadius.r10),
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(
                  text: order.title,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                  fontWeight: AppFontWeight.bold,
                  maxLines: 1,
                ),
                SizedBox(height: AppHeight.h4),
                BodyTitle(
                  text: order.number,
                  color: AppColors.secondaryText,
                  fontSize: AppFontSize.s12,
                  fontWeight: AppFontWeight.medium,
                ),
                SizedBox(height: AppHeight.h12),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: AppColors.secondaryText,
                      size: AppSize.s14,
                    ),
                    SizedBox(width: AppWidth.w4),
                    Flexible(
                      child: BodyTitle(
                        text: 'تاريخ الطلب : ${order.date}',
                        color: AppColors.primaryDark,
                        fontSize: AppFontSize.s10,
                        fontWeight: AppFontWeight.medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: AppWidth.w10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              StatusBadge(status: order.status, showOuterCircle: false),
              SizedBox(height: AppHeight.h14),
              StatusIcon(status: order.status),
            ],
          ),
        ],
      ),
    ),
  );
}
