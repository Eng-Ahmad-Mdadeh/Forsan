import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/domain/entities/document/document_entity.dart';
import 'package:forsan/presentation/bloc/document_details/document_details_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/models/document_list/document_list_model.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/failure_screen.dart';
import '../../widgets/required_action_card.dart';
import '../../widgets/text/section_title.dart';
import 'models/document_details_models.dart';
import 'widgets/attached_documents_card.dart';
import 'widgets/document_complete_requirements_button.dart';
import 'widgets/document_list_card.dart';
import 'widgets/document_request_header_card.dart';

class DocumentDetailsScreen extends StatelessWidget {
  final Item? item;

  const DocumentDetailsScreen({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DocumentDetailsBloc>(create: (_) => DocumentDetailsBloc()),
      ],
      child: BodyDocumentDetailsScreen(item: item),
    );
  }
}

class BodyDocumentDetailsScreen extends StatefulWidget {
  const BodyDocumentDetailsScreen({
    super.key,
    this.state = DocumentDetailsState.underReview,
    this.item,
  });

  final Item? item;

  final DocumentDetailsState state;

  @override
  State<BodyDocumentDetailsScreen> createState() =>
      _BodyDocumentDetailsScreenState();
}

class _BodyDocumentDetailsScreenState extends State<BodyDocumentDetailsScreen> {
  static final Item _skeletonItem = Item(
    id: '',
    reference: 'FR-2026-000000',
    serviceSlug: '',
    serviceName: 'تأسيس شركة جديدة',
    categoryName: null,
    status: null,
    displayStatus: null,
    statusLabel: 'قيد المراجعة',
    progress: null,
    createdAt: DateTime(2026, 9, 23),
    consultant: 'اسم المستشار',
    documentsStatus: null,
    documentsStatusLabel: null,
    requiredCount: null,
    attachmentCount: null,
  );

  static const _requestDocuments = [
    DocumentDetailsData(name: 'جواز السفر', size: '1.2 ميجا بايت'),
    DocumentDetailsData(name: 'جواز السفر', size: '1.2 ميجا بايت'),
    DocumentDetailsData(name: 'جواز السفر', size: '1.2 ميجا بايت'),
  ];

  @override
  void initState() {
    super.initState();
    _loadDocumentDetails();
  }

  void _loadDocumentDetails() {
    final orderId = widget.item?.id;
    if (orderId == null || orderId.isEmpty) return;

    context.read<DocumentDetailsBloc>().add(
      DocumentDetailsEvent(DocumentEntity(orderId: orderId)),
    );
  }

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
        child: BlocBuilder<DocumentDetailsBloc, IDocumentDetailsState>(
          builder: (context, blocState) {
            if (blocState is DocumentDetailsFailed) {
              return FailureScreen(
                errorMessage: blocState.message,
                onPressed: _loadDocumentDetails,
              );
            }

            final isLoading =
                blocState is DocumentDetailsInitial ||
                blocState is DocumentDetailsLoading;
            final item = isLoading ? _skeletonItem : widget.item;

            return Skeletonizer(
              enabled: isLoading,
              enableSwitchAnimation: true,
              effect: ShimmerEffect(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                duration: const Duration(milliseconds: 500),
              ),
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
                          DocumentRequestHeaderCard(item: item),
                          if (widget.state ==
                              DocumentDetailsState.waitingDocuments) ...[
                            SizedBox(height: AppHeight.h12),
                            RequiredActionCard(
                              title: 'إجراء مطلوب',
                              message:
                                  'يرجى إرفاق المستندات المطلوبة لاستكمال الطلب',
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
            );
          },
        ),
      ),
    ),
  );

  List<DocumentDetailsStatus>? get _requestDocumentStatuses =>
      switch (widget.state) {
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
