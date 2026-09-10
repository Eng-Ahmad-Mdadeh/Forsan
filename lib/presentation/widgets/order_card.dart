import 'package:flutter/material.dart';
import 'package:forsan/presentation/widgets/status_badge.dart';
import 'package:forsan/presentation/widgets/status_icon.dart';
import '../../core/resources/app_colors.dart';
import '../../core/resources/app_fonts.dart';
import '../../core/resources/app_values.dart';
import 'text/body_title.dart';
import 'text/section_title.dart';
import '../screens/orders/models/order_item.dart';
import '../screens/orders/widgets/order_status_badge.dart';
import '../screens/orders/widgets/order_status_icon.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
    this.onDetailsPressed,
    this.showFooter = true,
    this.showDateLabel = false,
  });

  final OrderItem order;
  final VoidCallback? onDetailsPressed;
  final bool showFooter;
  final bool showDateLabel;

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Semantics(
      container: true,
      label: '${order.title}، ${order.number}، ${order.status.label}',
      child: Container(
        height: showFooter ? AppHeight.h150 : AppHeight.h120,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.r13),
          border: Border.all(color: AppColors.lightGrey),
          boxShadow: [
            BoxShadow(
              color: AppColors.homeSoftShadow,
              blurRadius: AppRadius.r7,
              offset: Offset(0, AppHeight.h2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: AppWidth.w6, color: order.status.color),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                  AppPaddingWidth.p13,
                  AppPaddingHeight.p13,
                  AppPaddingWidth.p13,
                  AppPaddingHeight.p10,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _OrderInformation(
                              order: order,
                              showDateLabel: showDateLabel,
                            ),
                          ),
                          SizedBox(width: AppWidth.w10),
                          _OrderState(status: order.status),
                        ],
                      ),
                    ),
                    if (showFooter)
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline_rounded,
                            color: AppColors.secondaryText,
                            size: AppSize.s18,
                          ),
                          SizedBox(width: AppWidth.w4),
                          Expanded(
                            child: BodyTitle(
                              text: 'المستشار: ${order.consultant}',
                              color: AppColors.secondaryText,
                              fontSize: AppFontSize.s11,
                              fontWeight: AppFontWeight.regular,
                              maxLines: 1,
                            ),
                          ),
                          _DetailsButton(onPressed: onDetailsPressed),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _OrderInformation extends StatelessWidget {
  const _OrderInformation({
    required this.order,
    required this.showDateLabel,
  });

  final OrderItem order;
  final bool showDateLabel;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SectionTitle(
        text: order.title,
        color: AppColors.primaryDark,
        fontSize: AppFontSize.s15,
        fontWeight: AppFontWeight.bold,
        maxLines: 1,
      ),
      SizedBox(height: AppHeight.h6),
      BodyTitle(
        text: order.number,
        color: AppColors.secondaryText,
        fontSize: AppFontSize.s11,
        fontWeight: AppFontWeight.regular,
      ),
      SizedBox(height: AppHeight.h5),
      Row(
        children: [
          Icon(
            Icons.calendar_today_outlined,
            color: AppColors.secondaryText,
            size: AppSize.s14,
          ),
          SizedBox(width: AppWidth.w4),
          BodyTitle(
            text: showDateLabel
                ? 'تاريخ الطلب : ${order.date}'
                : order.date,
            color: AppColors.primaryDark,
            fontSize: AppFontSize.s10,
            fontWeight: AppFontWeight.medium,
          ),
        ],
      ),
    ],
  );
}

class _OrderState extends StatelessWidget {
  const _OrderState({required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      StatusBadge(status: status),
      SizedBox(height: AppHeight.h14),
      Align(
        alignment: AlignmentDirectional.centerEnd,
        child: StatusIcon(status: status),
      ),
    ],
  );
}

class _DetailsButton extends StatelessWidget {
  const _DetailsButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: 'تفاصيل الطلب',
    child: InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppRadius.r7),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppPaddingHeight.p4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BodyTitle(
              text: 'تفاصيل الطلب',
              color: AppColors.primaryDark,
              fontSize: AppFontSize.s11,
              fontWeight: AppFontWeight.bold,
            ),
            SizedBox(width: AppWidth.w6),
            Icon(
              Icons.arrow_back_rounded,
              color: AppColors.primaryDark,
              size: AppSize.s17,
            ),
          ],
        ),
      ),
    ),
  );
}
