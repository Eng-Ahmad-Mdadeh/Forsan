import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/status_pill.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';
import '../models/document_details_models.dart';

class DocumentRequestHeaderCard extends StatelessWidget {
  const DocumentRequestHeaderCard({super.key, required this.state});

  final DocumentDetailsState state;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(AppPaddingWidth.p14),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppRadius.r12),
      boxShadow: [
        BoxShadow(
          color: AppColors.homeSoftShadow,
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
                text: 'تأسيس شركة لشخص واحد',
                color: AppColors.primaryDark,
                fontSize: AppFontSize.s14,
                fontWeight: AppFontWeight.bold,
              ),
              SizedBox(height: AppHeight.h5),
              BodyTitle(
                text: 'FR-2026-00125925',
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
                    text: 'تاريخ الطلب: 20/05/2026',
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
            Pill(
              label: _label,
              background: _backgroundColor,
              foreground: _foregroundColor,
            ),
            SizedBox(height: AppHeight.h14),
            Container(
              width: AppWidth.w30,
              height: AppHeight.h30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(_icon, color: _foregroundColor, size: AppSize.s17),
            ),
          ],
        ),
      ],
    ),
  );

  String get _label => switch (state) {
    DocumentDetailsState.underReview => 'قيد المراجعة',
    DocumentDetailsState.waitingDocuments => 'بانتظار المستندات',
    DocumentDetailsState.inProgress => 'قيد التنفيذ',
    DocumentDetailsState.completed => 'مكتمل',
  };

  Color get _foregroundColor => switch (state) {
    DocumentDetailsState.underReview => AppColors.blue,
    DocumentDetailsState.waitingDocuments => AppColors.secondaryNormal,
    DocumentDetailsState.inProgress => AppColors.homeSupportAction,
    DocumentDetailsState.completed => AppColors.darkGreen,
  };

  Color get _backgroundColor => switch (state) {
    DocumentDetailsState.underReview => AppColors.blueText,
    DocumentDetailsState.waitingDocuments => AppColors.secondaryLightHover,
    DocumentDetailsState.inProgress => AppColors.light,
    DocumentDetailsState.completed => AppColors.lightGreen,
  };

  IconData get _icon => switch (state) {
    DocumentDetailsState.underReview => Icons.access_time_rounded,
    DocumentDetailsState.waitingDocuments => Icons.folder_copy_outlined,
    DocumentDetailsState.inProgress => Icons.settings_outlined,
    DocumentDetailsState.completed => Icons.check_circle_outline_rounded,
  };
}
