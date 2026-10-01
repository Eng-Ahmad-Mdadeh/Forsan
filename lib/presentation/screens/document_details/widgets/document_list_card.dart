import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:forsan/data/models/document_details/document_details_model.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/helper/network_helper.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/services/locator/locator.dart';
import '../../../widgets/status_badge.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';


class DocumentListCard extends StatelessWidget {
   DocumentListCard({
    super.key,
    required this.title,
     this.documents,
  });

  final String title;

  final DocumentDetailsModel? documents;


  late final uploads = documents?.uploads ?? const <AttachmentModel>[];


  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(AppPaddingWidth.p10),
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

        for (var index = 0; index < uploads.length; index++) ...[
          _DocumentRow(document: uploads[index]),
          if (index != uploads.length - 1)
            SizedBox(height: AppHeight.h6),
        ],
      ],
    ),
  );
}

class _DocumentRow extends StatelessWidget {
  const _DocumentRow({required this.document});

  final AttachmentModel document;



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
          width: AppWidth.w40,
          height: AppHeight.h40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.circular(AppRadius.r7),
          ),
          child: Icon(
            Icons.insert_drive_file_outlined,
            color: AppColors.secondaryText,
            size: AppSize.s24,
          ),
        ),
        SizedBox(width: AppWidth.w8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyTitle(
                text: document.name ?? '',
                color: AppColors.blackText,
                fontSize: AppFontSize.s14,
                fontWeight: AppFontWeight.medium,
              ),
              SizedBox(height: AppHeight.h3),
              BodyTitle(
                text: document.size == null
                    ? ''
                    : '${(document.size! / (1024 * 1024)).toStringAsFixed(1)} ميجا بايت',
                color: AppColors.secondaryText,
                fontSize: AppFontSize.s10,
                fontWeight: AppFontWeight.regular,
              ),
            ],
          ),
        ),
        Column(
          children: [
            StatusBadge(
              status: document.status ?? '',
              fontSize: AppSize.s12,
              fontWeight: AppFontWeight.medium,
            ),
            SizedBox(height: AppHeight.h4),
            InkWell(
              onTap: () async {
                final documentId = document.id;
                if (documentId == null || documentId.isEmpty) return;

                final result = await locator<NetworkHelper>().downloadFile(
                  ApiEndpoints.downloadFile(documentId),
                );

                await result.fold(
                  (error) async {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error.message)),
                    );
                  },
                  (bytes) async {
                    try {
                      final outputPath = await FilePicker.platform.saveFile(
                        dialogTitle: 'حفظ الملف',
                        fileName: document.name ?? 'document-$documentId',
                      );
                      if (outputPath == null) return;

                      await File(outputPath).writeAsBytes(bytes, flush: true);
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم تحميل الملف بنجاح')),
                      );
                    } catch (error) {
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())),
                      );
                    }
                  },
                );
              },
              borderRadius: BorderRadius.circular(AppRadius.r7),
              child: Container(
                width: AppWidth.w25,
                height: AppHeight.h25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.light,
                  borderRadius: BorderRadius.circular(AppRadius.r7),
                ),
                child: Icon(
                  Icons.file_download_outlined,
                  color: AppColors.primaryDark,
                  size: AppSize.s16,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
