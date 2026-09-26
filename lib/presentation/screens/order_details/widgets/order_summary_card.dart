import 'package:flutter/material.dart';
import 'package:forsan/data/models/order_details/order_details_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/extension/localization_extension.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/status_badge.dart';

import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
    required this.item,
  });

  final OrderDetailsModel item;

  String get _number => item.reference ?? '';
  String get _status => item.statusLabel ?? item.displayStatus ?? '';
  String get _date => item.createdAt == null
      ? ''
      : DateFormat('dd/MM/yyyy').format(item.createdAt!.toLocal());

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Semantics(
      container: true,
      label: '${context.loc.order_summary} $_number',
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.r12),
          boxShadow: [
            BoxShadow(
              color: AppColors.homeSoftShadow.withOpacity(0.05),
              blurRadius: AppRadius.r7,
              offset: Offset(0, AppHeight.h2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.r12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _OrderSummaryHeader(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p16),
                child: Column(
                  children: [
                    _OrderSummaryRow(
                      icon: Icons.tag_rounded,
                      label: context.loc.order_number,
                      value: _number,
                    ),
                    _OrderSummaryRow(
                      icon: Icons.person_outline_rounded,
                      label: context.loc.order_submitter,
                      value: item.applicantName ?? '',
                    ),
                    _OrderSummaryRow(
                      icon: Icons.calendar_today_outlined,
                      label: context.loc.order_date,
                      value: _date,
                    ),
                    _OrderSummaryRow(
                      icon: Icons.radio_button_checked_rounded,
                      label: context.loc.order_status,
                      valueWidget: StatusBadge(
                        status: _status,
                        showOuterCircle: false,
                      ),
                    ),
                    _OrderSummaryRow(
                      icon: Icons.work_outline_rounded,
                      label: context.loc.order_service,
                      value: item.categoryName ?? '',
                    ),
                    _OrderSummaryRow(
                      icon: Icons.grid_view_rounded,
                      label: context.loc.order_service_type,
                      value: item.serviceName ?? '',
                      showDivider: false,
                    ),
                    _OrderSummaryRow(
                      icon: Icons.payments_outlined,
                      label: context.loc.order_fees,
                      value: item.payment?.total?.toString() ?? '',
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

class _OrderSummaryHeader extends StatelessWidget {
  const _OrderSummaryHeader();

  @override
  Widget build(BuildContext context) => Container(
    height: AppHeight.h55,
    color: AppColors.primary,
    padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p18),
    child: Row(
      children: [
        SectionTitle(
          text: context.loc.order_summary,
          color: AppColors.white,
          fontSize: AppFontSize.s16,
          fontWeight: AppFontWeight.bold,
        ),
        const Spacer(),
        Icon(
          Icons.bookmark_rounded,
          color: AppColors.white,
          size: AppSize.s18,
        ),
      ],
    ),
  );
}

class _OrderSummaryRow extends StatelessWidget {
  const _OrderSummaryRow({
    required this.icon,
    required this.label,
    this.value,
    this.valueWidget,
    this.showDivider = true,
  }) : assert(value != null || valueWidget != null);

  final IconData icon;
  final String label;
  final String? value;
  final Widget? valueWidget;
  final bool showDivider;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SizedBox(
        height: AppHeight.h50,
        child: Row(
          children: [
            Icon(icon, color: AppColors.secondary, size: AppSize.s18),
            SizedBox(width: AppWidth.w10),
            BodyTitle(
              text: label,
              color: AppColors.blackCow,
              fontSize: AppFontSize.s14,
              fontWeight: AppFontWeight.regular,
            ),
            SizedBox(width: AppWidth.w10),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child:
                    valueWidget ??
                    BodyTitle(
                      text: value,
                      textAlign: TextAlign.end,
                      color: AppColors.blackCow,
                      fontSize: AppFontSize.s12,
                      fontWeight: AppFontWeight.bold,
                      maxLines: 2,
                    ),
              ),
            ),
          ],
        ),
      ),
      if (showDivider)
        Divider(height: AppHeight.h1, color: AppColors.secondaryLightActive),
    ],
  );
}
