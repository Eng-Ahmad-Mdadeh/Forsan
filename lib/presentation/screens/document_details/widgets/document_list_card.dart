import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/status_pill.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';
import '../models/document_details_models.dart';

class DocumentListCard extends StatelessWidget {
  const DocumentListCard({
    super.key,
    required this.title,
    required this.documents,
    required this.statuses,
  });

  final String title;
  final List<DocumentDetailsData> documents;
  final List<DocumentDetailsStatus>? statuses;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(AppPaddingWidth.p10),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppRadius.r12),
      border: Border.all(color: AppColors.lightGrey),
      boxShadow: [
        BoxShadow(
          color: AppColors.homeSoftShadow,
          blurRadius: AppRadius.r7,
          offset: Offset(0, AppHeight.h2),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: AppWidth.w30,
              height: AppHeight.h30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.light,
                borderRadius: BorderRadius.circular(AppRadius.r8),
              ),
              child: Icon(
                Icons.description_outlined,
                size: AppSize.s17,
                color: AppColors.homeSupportAction,
              ),
            ),
            SizedBox(width: AppWidth.w8),
            SectionTitle(
              text: title,
              color: AppColors.mainText,
              fontSize: AppFontSize.s14,
              fontWeight: AppFontWeight.bold,
            ),
          ],
        ),
        SizedBox(height: AppHeight.h8),
        for (var index = 0; index < documents.length; index++) ...[
          _DocumentRow(document: documents[index], status: statuses?[index]),
          if (index != documents.length - 1)
            SizedBox(height: AppHeight.h6),
        ],
      ],
    ),
  );
}

class _DocumentRow extends StatelessWidget {
  const _DocumentRow({required this.document, this.status});

  final DocumentDetailsData document;
  final DocumentDetailsStatus? status;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: AppPaddingWidth.p8,
      vertical: AppPaddingHeight.p8,
    ),
    decoration: BoxDecoration(
      color: AppColors.backGround,
      borderRadius: BorderRadius.circular(AppRadius.r8),
    ),
    child: Row(
      children: [
        Container(
          width: AppWidth.w32,
          height: AppHeight.h32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.circular(AppRadius.r7),
          ),
          child: Icon(
            Icons.insert_drive_file_outlined,
            color: AppColors.secondaryText,
            size: AppSize.s16,
          ),
        ),
        SizedBox(width: AppWidth.w8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyTitle(
                text: document.name,
                color: AppColors.mainText,
                fontSize: AppFontSize.s12,
                fontWeight: AppFontWeight.medium,
              ),
              SizedBox(height: AppHeight.h3),
              BodyTitle(
                text: document.size,
                color: AppColors.secondaryText,
                fontSize: AppFontSize.s8,
                fontWeight: AppFontWeight.regular,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (status != null) ...[
              Pill(
                label: status!.label,
                background: status!.backgroundColor,
                foreground: status!.foregroundColor,
              ),
              SizedBox(height: AppHeight.h4),
            ],
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(AppRadius.r7),
              child: Container(
                width: AppWidth.w24,
                height: AppHeight.h24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.light,
                  borderRadius: BorderRadius.circular(AppRadius.r7),
                ),
                child: Icon(
                  Icons.file_download_outlined,
                  color: AppColors.secondaryText,
                  size: AppSize.s14,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
