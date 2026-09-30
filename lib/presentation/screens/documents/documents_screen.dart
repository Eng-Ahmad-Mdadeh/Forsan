import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/utils/pagination/pagination_scroll_mixin.dart';
import 'package:forsan/data/models/document_list/document_list_model.dart';
import 'package:forsan/domain/entities/order_list/order_list_entity.dart';
import 'package:forsan/presentation/bloc/document_list/document_list_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/failure_screen.dart';
import '../../widgets/text/section_title.dart';
import '../document_details/document_details_screen.dart';
import 'widgets/document_order_card.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<DocumentListBloc>(
    create: (_) => DocumentListBloc(),
    child: const _BodyDocumentsScreen(),
  );
}

class _BodyDocumentsScreen extends StatefulWidget {
  const _BodyDocumentsScreen();

  @override
  State<_BodyDocumentsScreen> createState() => _BodyDocumentsScreenState();
}

class _BodyDocumentsScreenState extends State<_BodyDocumentsScreen>
    with PaginationScrollMixin<_BodyDocumentsScreen> {
  static const _entity = OrderListEntity();

  static final Item _skeletonDocument = Item(
    id: '',
    reference: 'FR-2026-000000',
    serviceSlug: '',
    serviceName: 'تأسيس شركة جديدة',
    categoryName: null,
    status: null,
    displayStatus: null,
    statusLabel: null,
    progress: null,
    createdAt: null,
    consultant: 'اسم المستشار',
    documentsStatus: null,
    documentsStatusLabel: 'بانتظار المستندات',
    requiredCount: null,
    attachmentCount: null,
  );

  static final List<Item> _skeletonDocuments = [
    _skeletonDocument,
    _skeletonDocument,
    _skeletonDocument,
  ];

  @override
  bool get canLoadMore => context.read<DocumentListBloc>().canLoadMore;

  @override
  bool get isLoadingMore => context.read<DocumentListBloc>().isLoadingMore;

  @override
  void initState() {
    super.initState();
    _loadDocuments();
  }

  @override
  void onLoadMore() {
    context.read<DocumentListBloc>().add(
      const LoadMoreDocumentListEvent(_entity),
    );
  }

  void _loadDocuments() {
    context.read<DocumentListBloc>().add(const GetDocumentListEvent(_entity));
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DocumentListBloc, IDocumentListState>(
        builder: (context, state) {
          if (state is DocumentListFailed) {
            return Scaffold(
              backgroundColor: AppColors.white,
              appBar: _buildAppBar(),
              body: FailureScreen(
                errorMessage: state.message,
                onPressed: _loadDocuments,
              ),
            );
          }

          final isLoading =
              state is DocumentListInitial || state is DocumentListLoading;
          final documents = isLoading
              ? _skeletonDocuments
              : state is DocumentListLoaded
              ? state.items
              : const <Item>[];

          return Skeletonizer(
            enableSwitchAnimation: true,
            effect: ShimmerEffect(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
              duration: const Duration(milliseconds: 500),
            ),
            enabled: isLoading,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: _buildAppBar(),
              body: SafeArea(
                child: documents.isNotEmpty
                    ? ListView.separated(
                        controller: paginationScrollController,
                        padding: EdgeInsetsDirectional.fromSTEB(
                          AppPaddingWidth.p16,
                          AppPaddingHeight.p14,
                          AppPaddingWidth.p16,
                          AppPaddingHeight.p24,
                        ),
                        itemCount: documents.length,
                        separatorBuilder: (_, _) =>
                            SizedBox(height: AppHeight.h12),
                        itemBuilder: (context, index) => DocumentOrderCard(
                          item: documents[index],
                          onDetailsPressed: () =>
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const DocumentDetailsScreen(
                                    state:
                                        DocumentDetailsState.waitingDocuments,
                                  ),
                                ),
                              ),
                        ),
                      )
                    : const _EmptyDocumentsState(),
              ),
            ),
          );
        },
      );

  CustomAppBar _buildAppBar() => CustomAppBar(
    title: 'المستندات',
    backgroundColor: AppColors.white,
    toolbarHeight: AppHeight.h70,
    showScrolledUnderElevation: false,
    titleSpacing: AppPaddingWidth.p16,
    titleWidget: SectionTitle(
      text: 'المستندات',
      color: AppColors.mainText,
      fontSize: AppFontSize.s18,
      fontWeight: AppFontWeight.bold,
    ),
    customActions: [
      HeaderIconButton(
        icon: Iconsax.notification_outline,
        onTap: () {},
      ),
    ],
  );
}

class _EmptyDocumentsState extends StatelessWidget {
  const _EmptyDocumentsState();

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: EdgeInsets.all(AppPaddingWidth.p31),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: AppRadius.r45,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: Icon(
              Icons.folder_copy_outlined,
              size: AppSize.s40,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: AppHeight.h20),
          SectionTitle(
            text: 'لا توجد مستندات بعد',
            fontSize: AppFontSize.s20,
            fontWeight: AppFontWeight.extraBold,
          ),
          SizedBox(height: AppHeight.h8),
          Text(
            'ستظهر هنا الطلبات التي تحتوي على مستندات مطلوبة.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.greyText, height: 1.5),
          ),
        ],
      ),
    ),
  );
}
