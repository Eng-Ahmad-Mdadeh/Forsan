import 'package:flutter/material.dart';
import 'package:forsan/data/models/order_details/order_details_model.dart';
import 'package:forsan/presentation/widgets/status_badge.dart';
import 'package:forsan/presentation/widgets/status_icon.dart';
import 'package:intl/intl.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/section_card.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';
class OrderDetailsHeaderCard extends StatelessWidget {
  const OrderDetailsHeaderCard({
    super.key,
    required this.item,
  });

  final OrderDetailsModel item;

  String get _title => item.serviceName ?? '';
  String get _number => item.reference ?? '';
  String get _status => item.statusLabel ?? item.displayStatus ?? '';
  String get _date => item.createdAt == null
      ? ''
      : DateFormat('dd/MM/yyyy').format(item.createdAt!.toLocal());

  @override
  Widget build(BuildContext context) => Semantics(
    container: true,
    label: '$_title، $_number، $_status',
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
                  text: _title,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                  fontWeight: AppFontWeight.bold,
                  maxLines: 1,
                ),
                SizedBox(height: AppHeight.h4),
                BodyTitle(
                  text: _number,
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
                        text: 'تاريخ الطلب : $_date',
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
              StatusBadge(status: _status, showOuterCircle: false),
              SizedBox(height: AppHeight.h14),
              StatusIcon(status: _status),
            ],
          ),
        ],
      ),
    ),
  );
}
