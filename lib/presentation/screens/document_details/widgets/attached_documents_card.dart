import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';

class AttachedDocumentsCard extends StatelessWidget {
  const AttachedDocumentsCard({super.key});

  static const _documents = [
    _AttachedDocument(name: 'عرض السعر', details: '1.2 ميجا بايت JPG'),
    _AttachedDocument(name: 'وثيقة الرخصة', details: '1.2 ميجا بايت JPG'),
    _AttachedDocument(name: 'السجل التجاري', details: '1.2 ميجا بايت JPG'),
  ];

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
        const _AttachedDocumentsHeader(),
        SizedBox(height: AppHeight.h8),
        for (var index = 0; index < _documents.length; index++) ...[
          _AttachedDocumentRow(document: _documents[index]),
          if (index != _documents.length - 1)
            SizedBox(height: AppHeight.h8),
        ],
      ],
    ),
  );
}

class _AttachedDocumentsHeader extends StatelessWidget {
  const _AttachedDocumentsHeader();

  @override
  Widget build(BuildContext context) => Row(
    children: [
      _IconBox(
        width: AppWidth.w30,
        height: AppHeight.h30,
        icon: Icons.description_outlined,
        iconSize: AppSize.s17,
      ),
      SizedBox(width: AppWidth.w8),
      SectionTitle(
        text: 'المستندات المرفقة',
        color: AppColors.mainText,
        fontSize: AppFontSize.s14,
        fontWeight: AppFontWeight.bold,
      ),
    ],
  );
}

class _AttachedDocumentRow extends StatelessWidget {
  const _AttachedDocumentRow({required this.document});

  final _AttachedDocument document;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: AppPaddingWidth.p8,
      vertical: AppPaddingHeight.p10,
    ),
    decoration: BoxDecoration(
      color: AppColors.backGround,
      borderRadius: BorderRadius.circular(AppRadius.r8),
    ),
    child: Row(
      children: [
        _IconBox(
          width: AppWidth.w40,
          height: AppHeight.h42,
          icon: Icons.insert_drive_file_outlined,
          iconSize: AppSize.s22,
        ),
        SizedBox(width: AppWidth.w8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyTitle(
                text: document.name,
                color: AppColors.mainText,
                fontSize: AppFontSize.s13,
                fontWeight: AppFontWeight.medium,
              ),
              SizedBox(height: AppHeight.h3),
              BodyTitle(
                text: document.details,
                color: AppColors.secondaryText,
                fontSize: AppFontSize.s10,
                fontWeight: AppFontWeight.regular,
              ),
            ],
          ),
        ),
        SizedBox(width: AppWidth.w8),
        Semantics(
          button: true,
          label: 'تحميل ${document.name}',
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(AppRadius.r8),
            child: _IconBox(
              width: AppWidth.w30,
              height: AppHeight.h30,
              icon: Icons.file_download_outlined,
              iconSize: AppSize.s17,
            ),
          ),
        ),
      ],
    ),
  );
}

class _IconBox extends StatelessWidget {
  const _IconBox({
    required this.width,
    required this.height,
    required this.icon,
    required this.iconSize,
  });

  final double width;
  final double height;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.light,
      borderRadius: BorderRadius.circular(AppRadius.r8),
    ),
    child: Icon(
      icon,
      color: AppColors.normal,
      size: iconSize,
    ),
  );
}

class _AttachedDocument {
  const _AttachedDocument({required this.name, required this.details});

  final String name;
  final String details;
}
