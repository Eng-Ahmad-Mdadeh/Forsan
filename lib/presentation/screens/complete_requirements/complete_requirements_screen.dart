import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/helper/file_picker_helper.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/document_details/document_details_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/presentation/bloc/file/confirm_file/confirm_file_bloc.dart';
import 'package:forsan/presentation/bloc/file/upload_file/upload_file_bloc.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/screens/complete_requirements/widgets/complete_requirements_documents.dart';
import 'package:forsan/presentation/screens/complete_requirements/widgets/complete_requirements_notice_card.dart';
import 'package:forsan/presentation/screens/complete_requirements/widgets/confirm_requirements_button.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/loading_widget.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class CompleteRequirementsScreen extends StatelessWidget {
  final List<RequiredDocumentModel>? model;
  final RequiredActionModel? requiredAction;

  const CompleteRequirementsScreen({
    super.key,
    this.model,
    this.requiredAction,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UploadFileBloc>(create: (_) => UploadFileBloc()),
        BlocProvider<NewOrderCubit>(create: (_) => NewOrderCubit()),
        BlocProvider<ConfirmFileBloc>(create: (_) => ConfirmFileBloc()),
      ],
      child: BodyCompleteRequirementsScreen(
        model: model,
        requiredAction: requiredAction,
      ),
    );
  }
}

class BodyCompleteRequirementsScreen extends StatefulWidget {
  final List<RequiredDocumentModel>? model;
  final RequiredActionModel? requiredAction;

  const BodyCompleteRequirementsScreen({
    super.key,
    this.model,
    this.requiredAction,
  });

  @override
  State<BodyCompleteRequirementsScreen> createState() =>
      _BodyCompleteRequirementsScreenState();
}

class _BodyCompleteRequirementsScreenState
    extends State<BodyCompleteRequirementsScreen> {
  final Map<String, String?> _uploadedFileIds = {};

  Future<void> _pickDocument(
    BuildContext context,
    RequiredDocumentModel document,
  ) async {
    if (context.read<UploadFileBloc>().state is UploadFileLoading) return;

    final requirementId = document.id?.trim() ?? '';
    final requestId = widget.requiredAction?.requestId?.trim() ?? '';
    if (requirementId.isEmpty || requestId.isEmpty) return;

    final cubit = context.read<NewOrderCubit>();
    final previousDocument =
        cubit.state.orderEntity.requirementDocuments[requirementId];
    final acceptedTypes = FilePickerHelper.normalizeExtensions(
      document.acceptedTypes,
    );
    final maxSize =
        document.maxSize ?? AppFileConstraints.maxDocumentSizeInBytes;
    final selection = await FilePickerHelper.selectDocumentSource(
      context,
      acceptedTypes,
    );
    if (!context.mounted || selection == null) return;

    final rejectedDocuments = selection.source == DocumentSource.image
        ? await cubit.pickImageForRequirement(
            context,
            requirementId,
            acceptedTypes: selection.allowedExtensions,
            maxSize: maxSize,
          )
        : await cubit.pickDocumentForRequirement(
            requirementId,
            allowedExtensions: selection.allowedExtensions,
            maxSize: maxSize,
          );
    if (!context.mounted) return;

    final selectedDocument =
        cubit.state.orderEntity.requirementDocuments[requirementId];
    if (rejectedDocuments == 0 &&
        selectedDocument != null &&
        selectedDocument != previousDocument) {
      context.read<UploadFileBloc>().add(
        UploadFileEvent(
          CreateOrderEntity(
            orderId: requestId,
            requiredDocumentItemId: requirementId,
            requirementDocuments: {requirementId: selectedDocument},
          ),
          requirementId: requirementId,
        ),
      );
      return;
    }

    if (rejectedDocuments > 0) {
      _showError(context, context.loc.new_order_documents_size_error);
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: BodyTitle(
          text: message,
          color: AppColors.white,
          fontWeight: AppFontWeight.regular,
        ),
        backgroundColor: AppColors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmFileBloc, IConfirmFileState>(
      listener: (context, state) {
        if (state is ConfirmFileLoading) {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (_) =>
                const PopScope(canPop: false, child: LoadingWidget(0)),
          );
        } else if (state is ConfirmFileFailed) {
          Navigator.of(context, rootNavigator: true).pop();
          _showError(context, state.message);
        } else if (state is ConfirmFileLoaded) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.of(context).pop();
        }
      },
      child: _buildScreen(context),
    );
  }

  Widget _buildScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: context.loc.order_complete_requirements,
        backgroundColor: AppColors.white,
        showBackButton: true,
        centerTitle: true,
        showScrolledUnderElevation: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            AppPaddingWidth.p16,
            AppPaddingHeight.p20,
            AppPaddingWidth.p16,
            AppPaddingHeight.p24,
          ),
          children: [
            CompleteRequirementsNoticeCard(
              title: widget.requiredAction?.title ?? '',
            ),
            SizedBox(height: AppHeight.h24),
            CompleteRequirementsDocuments(
              documents: widget.model ?? const [],
              uploadedFileIds: _uploadedFileIds,
              onPickDocument: (document) => _pickDocument(context, document),
              onFileUploaded: (requirementId, fileId) {
                setState(() => _uploadedFileIds[requirementId] = fileId);
              },
              onUploadFailed: (requirementId, message) {
                context
                    .read<NewOrderCubit>()
                    .removeDocumentForRequirement(requirementId);
                _showError(context, message);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(
          AppPaddingWidth.p16,
          AppPaddingHeight.p10,
          AppPaddingWidth.p16,
          AppPaddingHeight.p16,
        ),
        child: ConfirmRequirementsButton(
          onPressed: () {
            context.read<ConfirmFileBloc>().add(
              ConfirmFileEvent(
                CreateOrderEntity(
                  orderId: widget.requiredAction?.reference ?? '',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
