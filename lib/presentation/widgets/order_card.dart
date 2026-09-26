import 'package:flutter/material.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';
import 'package:forsan/presentation/widgets/status_badge.dart';
import 'package:forsan/presentation/widgets/status_icon.dart';
import 'package:intl/intl.dart';
import '../../core/resources/app_colors.dart';
import '../../core/resources/app_fonts.dart';
import '../../core/resources/app_values.dart';
import 'text/body_title.dart';
import 'text/section_title.dart';
class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.item,
    this.onDetailsPressed,
    this.showFooter = true,
    this.showDateLabel = false,
    this.detailsButtonText = 'تفاصيل الطلب',
  });

  final Item item;
  final VoidCallback? onDetailsPressed;
  final bool showFooter;
  final bool showDateLabel;
  final String detailsButtonText;

  String get _title => item.serviceName ?? '';
  String get _number => item.reference ?? '';
  String get _status => item.statusLabel ?? item.displayStatus ?? '';
  String get _date => item.createdAt == null
      ? ''
      : DateFormat('dd/MM/yyyy').format(item.createdAt!.toLocal());

  String get _consultant {
    final consultant = item.consultant;
    if (consultant is Map<String, dynamic>) {
      return consultant['fullName']?.toString() ?? '';
    }
    return consultant?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Semantics(
      container: true,
      label: '$_title، $_number، $_status',
      child: Container(
        height: showFooter ? AppHeight.h150 : AppHeight.h120,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.r13),
          //border: Border.all(color: AppColors.lightGrey),
          boxShadow: [
            BoxShadow(
              color: AppColors.homeSoftShadow.withOpacity(0.05),
              blurRadius: AppRadius.r7,
              offset: Offset(0, AppHeight.h2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: AppWidth.w6,
              color: StatusBadge.colorFor(_status),
            ),
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
                              title: _title,
                              number: _number,
                              date: _date,
                              showDateLabel: showDateLabel,
                            ),
                          ),
                          SizedBox(width: AppWidth.w10),
                          _OrderState(status: _status),
                        ],
                      ),
                    ),
                    if (showFooter)
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline_rounded,
                            color: AppColors.secondaryText,
                            size: AppSize.s16,
                          ),
                          SizedBox(width: AppWidth.w4),
                          Expanded(
                            child: BodyTitle(
                              text: 'المستشار : $_consultant',
                              color: AppColors.primaryDark,
                              fontSize: AppFontSize.s10,
                              fontWeight: AppFontWeight.medium,
                              maxLines: 1,
                            ),
                          ),
                          _DetailsButton(
                            text: detailsButtonText,
                            onPressed: onDetailsPressed,
                          ),
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
    required this.title,
    required this.number,
    required this.date,
    required this.showDateLabel,
  });

  final String title;
  final String number;
  final String date;
  final bool showDateLabel;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SectionTitle(
        text: title,
        color: AppColors.primaryDark,
        fontSize: AppFontSize.s14,
        fontWeight: AppFontWeight.bold,
        maxLines: 1,
      ),
      SizedBox(height: AppHeight.h6),
      BodyTitle(
        text: number,
        color: AppColors.secondaryText,
        fontSize: AppFontSize.s12,
        fontWeight: AppFontWeight.medium,
      ),
      SizedBox(height: AppHeight.h5),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            color: AppColors.secondaryText,
            size: AppSize.s12,
          ),
          SizedBox(width: AppWidth.w4),
          BodyTitle(
            text: showDateLabel ? 'تاريخ الطلب : $date' : date,
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

  final String status;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      StatusBadge(
        status: status,
        fontSize: AppSize.s12,
        fontWeight: AppFontWeight.medium,
      ),
      SizedBox(height: AppHeight.h14),
      Align(
        alignment: AlignmentDirectional.centerEnd,
        child: StatusIcon(status: status),
      ),
    ],
  );
}

class _DetailsButton extends StatelessWidget {
  const _DetailsButton({required this.text, this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: text,
    child: InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppRadius.r7),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppPaddingHeight.p4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BodyTitle(
              text: text,
              color: AppColors.primaryDark,
              fontSize: AppFontSize.s11,
              fontWeight: AppFontWeight.bold,
            ),
            SizedBox(width: AppWidth.w6),
            Icon(
              Icons.arrow_forward_rounded,
              color: AppColors.primaryDark,
              size: AppSize.s17,
            ),
          ],
        ),
      ),
    ),
  );
}
