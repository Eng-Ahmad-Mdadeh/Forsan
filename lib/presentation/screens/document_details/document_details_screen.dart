import 'package:flutter/material.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';
import '../../../core/routes/app_routes.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/required_action_card.dart';
import '../../widgets/text/section_title.dart';
import 'models/document_details_models.dart';
import 'widgets/attached_documents_card.dart';
import 'widgets/document_complete_requirements_button.dart';
import 'widgets/document_list_card.dart';
import 'widgets/document_request_header_card.dart';


export 'models/document_details_models.dart' show DocumentDetailsState;

class DocumentDetailsScreen extends StatelessWidget {
  const DocumentDetailsScreen({
    super.key,
    this.state = DocumentDetailsState.underReview,
  });

  final DocumentDetailsState state;

  static const _requestDocuments = [
    DocumentDetailsData(name: 'جواز السفر', size: '1.2 ميجا بايت'),
    DocumentDetailsData(name: 'جواز السفر', size: '1.2 ميجا بايت'),
    DocumentDetailsData(name: 'جواز السفر', size: '1.2 ميجا بايت'),
  ];

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'تفاصيل المستند',
        backgroundColor: AppColors.white,
        toolbarHeight: AppHeight.h70,
        showBackButton: true,
        showScrolledUnderElevation: false,
        titleWidget: SectionTitle(
          text: 'تفاصيل المستند',
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
                    DocumentRequestHeaderCard(state: state),
                    if (state == DocumentDetailsState.waitingDocuments) ...[
                      SizedBox(height: AppHeight.h12),
                      RequiredActionCard(
                        title: 'إجراء مطلوب',

                        message: 'يرجى إرفاق المستندات المطلوبة لاستكمال الطلب',
                        buttonText: 'استكمال المتطلبات',
                        semanticsLabel: 'إجراء مطلوب',
                        onPressed: () =>
                            CompleteRequirementsRoute().push(context),
                      ),
                    ],
                    SizedBox(height: AppHeight.h14),
                    DocumentListCard(
                      title: 'مستندات الطلب',
                      documents: _requestDocuments,
                      statuses: _requestDocumentStatuses,
                    ),
                    // if (state == DocumentDetailsState.completed) ...[
                    //   SizedBox(height: AppHeight.h16),
                    //   const AttachedDocumentsCard(),
                    // ],
                    SizedBox(height: AppHeight.h16),
                    const AttachedDocumentsCard(),
                    SizedBox(height: AppHeight.h16),
                    DocumentCompleteRequirementsButton(onPressed: () {}),
                  ],
                ),
              ),
            ),
            // if (state == DocumentDetailsState.waitingDocuments)
            //   DocumentCompleteRequirementsButton(onPressed: () {}),
          ],
        ),
      ),
    ),
  );

  List<DocumentDetailsStatus>? get _requestDocumentStatuses => switch (state) {
    DocumentDetailsState.underReview => List.filled(
      _requestDocuments.length,
      DocumentDetailsStatus.underReview,
    ),
    DocumentDetailsState.waitingDocuments => const [
      DocumentDetailsStatus.approved,
      DocumentDetailsStatus.rejected,
      DocumentDetailsStatus.required,
    ],
    DocumentDetailsState.inProgress || DocumentDetailsState.completed =>
      List.filled(_requestDocuments.length, DocumentDetailsStatus.approved),
  };
}
