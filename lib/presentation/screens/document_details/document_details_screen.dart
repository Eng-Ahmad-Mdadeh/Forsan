import 'package:flutter/material.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/status_pill.dart';
import '../../widgets/text/body_title.dart';
import '../../widgets/text/section_title.dart';

enum DocumentDetailsState {
  underReview,
  waitingDocuments,
  inProgress,
  completed,
}

class DocumentDetailsScreen extends StatelessWidget {
  const DocumentDetailsScreen({
    super.key,
    this.state = DocumentDetailsState.underReview,
  });

  final DocumentDetailsState state;

  static const _requestDocuments = [
    _DocumentData(name: 'جواز السفر', size: '1.2 ميجا بايت'),
    _DocumentData(name: 'جواز السفر', size: '1.2 ميجا بايت'),
    _DocumentData(name: 'جواز السفر', size: '1.2 ميجا بايت'),
  ];

  static const _officialDocuments = [
    _DocumentData(name: 'عقد التأسيس', size: '1.2 ميجا بايت'),
    _DocumentData(name: 'وثيقة الرخصة', size: '1.2 ميجا بايت'),
    _DocumentData(name: 'السجل التجاري', size: '1.2 ميجا بايت'),
  ];

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'تفاصيل الطلب',
        backgroundColor: AppColors.white,
        toolbarHeight: AppHeight.h70,
        showBackButton: true,
        showScrolledUnderElevation: false,
        titleWidget: SectionTitle(
          text: 'تفاصيل الطلب',
          color: AppColors.mainText,
          fontSize: AppFontSize.s20,
          fontWeight: AppFontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  AppPaddingWidth.p16,
                  AppPaddingHeight.p14,
                  AppPaddingWidth.p16,
                  AppPaddingHeight.p20,
                ),
                child: Column(
                  children: [
                    _RequestHeader(state: state),
                    if (state == DocumentDetailsState.waitingDocuments) ...[
                      SizedBox(height: AppHeight.h12),
                      const _RequiredActionCard(),
                    ],
                    SizedBox(height: AppHeight.h14),
                    _DocumentsSection(
                      title: 'مستندات الطلب',
                      documents: _requestDocuments,
                      statuses: _requestDocumentStatuses,
                    ),
                    if (state == DocumentDetailsState.completed) ...[
                      SizedBox(height: AppHeight.h16),
                      const _DocumentsSection(
                        title: 'المستندات الرسمية',
                        documents: _officialDocuments,
                        statuses: null,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            if (state == DocumentDetailsState.waitingDocuments)
              _CompleteRequirementsButton(onPressed: () {}),
          ],
        ),
      ),
    ),
  );

  List<_DocumentStatus>? get _requestDocumentStatuses => switch (state) {
    DocumentDetailsState.underReview => List.filled(
      _requestDocuments.length,
      _DocumentStatus.underReview,
    ),
    DocumentDetailsState.waitingDocuments => const [
      _DocumentStatus.approved,
      _DocumentStatus.rejected,
      _DocumentStatus.required,
    ],
    DocumentDetailsState.inProgress || DocumentDetailsState.completed =>
      List.filled(_requestDocuments.length, _DocumentStatus.approved),
  };
}

class _RequestHeader extends StatelessWidget {
  const _RequestHeader({required this.state});

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

class _RequiredActionCard extends StatelessWidget {
  const _RequiredActionCard();

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(AppPaddingWidth.p14),
    decoration: BoxDecoration(
      color: AppColors.secondaryLightHover,
      borderRadius: BorderRadius.circular(AppRadius.r12),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.info_outline_rounded,
          color: AppColors.secondaryNormal,
          size: AppSize.s20,
        ),
        SizedBox(width: AppWidth.w8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                text: 'إجراء مطلوب',
                color: AppColors.mainText,
                fontSize: AppFontSize.s13,
              ),
              SizedBox(height: AppHeight.h6),
              BodyTitle(
                text: 'يرجى إرفاق المستندات المطلوبة لاستكمال الطلب.',
                color: AppColors.blackCow,
                fontSize: AppFontSize.s11,
                fontWeight: AppFontWeight.regular,
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: AppHeight.h10),
              Pill(
                label: 'استكمال المتطلبات',
                background: AppColors.secondaryNormal,
                foreground: AppColors.white,
                icon: Icons.file_upload_outlined,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _DocumentsSection extends StatelessWidget {
  const _DocumentsSection({
    required this.title,
    required this.documents,
    required this.statuses,
  });

  final String title;
  final List<_DocumentData> documents;
  final List<_DocumentStatus>? statuses;

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
          _DocumentRow(
            document: documents[index],
            status: statuses?[index],
          ),
          if (index != documents.length - 1)
            SizedBox(height: AppHeight.h6),
        ],
      ],
    ),
  );
}

class _DocumentRow extends StatelessWidget {
  const _DocumentRow({required this.document, this.status});

  final _DocumentData document;
  final _DocumentStatus? status;

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

class _CompleteRequirementsButton extends StatelessWidget {
  const _CompleteRequirementsButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Container(
    color: AppColors.white,
    padding: EdgeInsets.fromLTRB(
      AppPaddingWidth.p16,
      AppPaddingHeight.p8,
      AppPaddingWidth.p16,
      AppPaddingHeight.p16,
    ),
    child: SizedBox(
      width: double.infinity,
      child: CustomElevatedButton(
        height: AppHeight.h48,
        onPressed: onPressed,
        color: AppColors.primary,
        borderRadius: AppRadius.r8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.file_upload_outlined,
              color: AppColors.white,
              size: AppSize.s16,
            ),
            SizedBox(width: AppWidth.w8),
            BodyTitle(
              text: 'استكمال المتطلبات',
              color: AppColors.white,
              fontSize: AppFontSize.s12,
              fontWeight: AppFontWeight.medium,
            ),
          ],
        ),
      ),
    ),
  );
}

class _DocumentData {
  const _DocumentData({required this.name, required this.size});

  final String name;
  final String size;
}

enum _DocumentStatus {
  approved('معتمد', AppColors.lightGreen, AppColors.darkGreen),
  rejected('مرفوض', AppColors.lightRed, AppColors.red),
  required('مطلوب', AppColors.secondaryLightHover, AppColors.secondaryNormal),
  underReview('قيد المراجعة', AppColors.blueText, AppColors.blue);

  const _DocumentStatus(this.label, this.backgroundColor, this.foregroundColor);

  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
}
