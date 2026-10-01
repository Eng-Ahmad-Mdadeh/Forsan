import 'package:flutter/material.dart';
import 'package:forsan/data/models/document_list/document_list_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/status_badge.dart';
import '../../../widgets/status_icon.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';
import '../models/document_details_models.dart';

class DocumentRequestHeaderCard extends StatelessWidget {

  const DocumentRequestHeaderCard({super.key,  this.item});

  final Item? item;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(AppPaddingWidth.p14),
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
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                text: item?.serviceName ?? '',
                color: AppColors.primaryDark,
                fontSize: AppFontSize.s14,
                fontWeight: AppFontWeight.bold,
              ),
              SizedBox(height: AppHeight.h5),
              BodyTitle(
                text: item?.reference?? '',
                color: AppColors.secondaryText,
                fontSize: AppFontSize.s10,
                fontWeight: AppFontWeight.regular,
              ),
              SizedBox(height: AppHeight.h8),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.secondaryText,
                    size: AppSize.s12,
                  ),
                  SizedBox(width: AppWidth.w4),
                  BodyTitle(
                    text: item?.createdAt == null
                        ? ''
                        : DateFormat('dd/MM/yyyy').format(item!.createdAt!.toLocal()),
                    color: AppColors.mainText,
                    fontSize: AppFontSize.s10,
                    fontWeight: AppFontWeight.regular,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: AppWidth.w8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            StatusBadge(
              status: item?.statusLabel??item?.displayStatus??'',
              fontSize: AppSize.s12,
              fontWeight: AppFontWeight.medium,
            ),
            SizedBox(height: AppHeight.h14),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: StatusIcon(status:  item?.statusLabel??item?.displayStatus??'',),
            ),
          ],
        ),
      ],
    ),
  );
}
