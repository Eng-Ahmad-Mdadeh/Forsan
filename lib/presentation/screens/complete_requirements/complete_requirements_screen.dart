import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/document_details/document_details_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/presentation/bloc/file/delete_file/delete_file_bloc.dart';
import 'package:forsan/presentation/bloc/file/upload_file/upload_file_bloc.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';
import 'package:forsan/presentation/screens/create_order/widgets/uploaded_document_card.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_elevated_button.dart';
import 'package:forsan/presentation/widgets/document/document_section.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:mime/mime.dart';

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
        BlocProvider<DeleteFileBloc>(create: (_) => DeleteFileBloc()),
        BlocProvider<NewOrderCubit>(create: (_) => NewOrderCubit()),
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
    final acceptedTypes = _normalizedExtensions(document.acceptedTypes);
    final maxSize =
        document.maxSize ?? AppFileConstraints.maxDocumentSizeInBytes;
    final imageTypes = acceptedTypes
        .where(
          (type) => lookupMimeType('file.$type')?.startsWith('image/') == true,
        )
        .toSet();
    final fileTypes = acceptedTypes.toSet().difference(imageTypes);
    final source = fileTypes.isNotEmpty && imageTypes.isNotEmpty
        ? await _selectDocumentSource(context)
        : imageTypes.isNotEmpty
        ? _DocumentSource.image
        : _DocumentSource.file;
    if (!context.mounted || source == null) return;

    final rejectedDocuments = source == _DocumentSource.image
        ? await cubit.pickImageForRequirement(
            context,
            requirementId,
            acceptedTypes: imageTypes.toList(),
            maxSize: maxSize,
          )
        : await cubit.pickDocumentForRequirement(
            requirementId,
            allowedExtensions: fileTypes.toList(),
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

  List<String> _normalizedExtensions(List<String>? acceptedTypes) {
    final types = acceptedTypes?.isNotEmpty == true
        ? acceptedTypes!
        : AppFileConstraints.documentExtensions;
    return types
        .map((type) => type.split('/').last.toLowerCase().replaceFirst('.', ''))
        .toSet()
        .toList();
  }

  Future<_DocumentSource?> _selectDocumentSource(BuildContext context) =>
      showModalBottomSheet<_DocumentSource>(
        context: context,
        backgroundColor: AppColors.white,
        builder: (context) => SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.insert_drive_file_outlined,
                  color: AppColors.primary,
                ),
                title: BodyTitle(text: context.loc.documents),
                onTap: () => Navigator.pop(context, _DocumentSource.file),
              ),
              ListTile(
                leading: const Icon(
                  Icons.image_outlined,
                  color: AppColors.primary,
                ),
                title: BodyTitle(text: context.loc.image),
                onTap: () => Navigator.pop(context, _DocumentSource.image),
              ),
            ],
          ),
        ),
      );

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

  void _deleteDocument(BuildContext context, String requirementId) {
    if (context.read<DeleteFileBloc>().state is DeleteFileLoading) return;

    final requestId = widget.requiredAction?.requestId?.trim() ?? '';
    final fileId = _uploadedFileIds[requirementId];
    if (requestId.isEmpty || fileId?.isNotEmpty != true) return;

    context.read<DeleteFileBloc>().add(
      DeleteFileEvent(
        CreateOrderEntity(orderId: requestId, fileId: fileId),
        requirementId: requirementId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            SectionCard(
              backgroundColor: AppColors.secondaryLightHover,
              borderRadius: BorderRadius.circular(AppRadius.r20),
              padding: EdgeInsets.symmetric(
                horizontal: AppPaddingWidth.p16,
                vertical: AppPaddingHeight.p16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: AppColors.secondaryNormal,
                        size: AppSize.s30,
                      ),
                      SizedBox(width: AppWidth.w8),
                      Expanded(
                        child: SectionTitle(
                          text: widget.requiredAction?.title ?? '',
                          color: AppColors.mainText,
                          fontSize: AppFontSize.s13,
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: AppPaddingWidth.p35,
                    ),
                    child: BodyTitle(
                      text: context.loc.complete_requirements_notice,
                      color: AppColors.blackCow,
                      fontSize: AppFontSize.s12,
                      fontWeight: AppFontWeight.regular,
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppHeight.h24),
            SectionTitle(
              text: context.loc.complete_requirements_documents_title,
              fontSize: AppFontSize.s16,
            ),
            BlocConsumer<DeleteFileBloc, IDeleteFileState>(
              listener: (context, deleteState) {
                if (deleteState is DeleteFileLoaded) {
                  context.read<NewOrderCubit>().removeDocumentForRequirement(
                    deleteState.requirementId,
                  );
                  setState(() {
                    _uploadedFileIds.remove(deleteState.requirementId);
                  });
                }

                if (deleteState is DeleteFileFailed) {
                  _showError(context, deleteState.message);
                }
              },
              builder: (context, deleteState) =>
                  BlocConsumer<UploadFileBloc, IUploadFileState>(
                listener: (context, uploadState) {
                  if (uploadState is UploadFileLoaded) {
                    setState(() {
                      _uploadedFileIds[uploadState.requirementId] =
                          uploadState.response?.data?.id;
                    });
                  }

                  if (uploadState is UploadFileFailed) {
                    context.read<NewOrderCubit>().removeDocumentForRequirement(
                      uploadState.requirementId,
                    );
                    _showError(context, uploadState.message);
                  }
                },
                builder: (context, uploadState) =>
                    BlocBuilder<NewOrderCubit, NewOrderState>(
                  builder: (context, orderState) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.model?.length ?? 0,
                    itemBuilder: (context, index) {
                      final document = widget.model![index];
                      final requirementId = document.id?.trim() ?? '';
                      final selectedDocument = orderState
                          .orderEntity.requirementDocuments[requirementId];
                      final isLoading = uploadState is UploadFileLoading &&
                          uploadState.requirementId == requirementId;
                      final isDeleting = deleteState is DeleteFileLoading &&
                          deleteState.requirementId == requirementId;
                      final isUploaded =
                          _uploadedFileIds.containsKey(requirementId);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (isUploaded && selectedDocument != null)
                            Padding(
                              padding: EdgeInsets.only(
                                top: AppPaddingHeight.p12,
                              ),
                              child: UploadedDocumentCard(
                                document: selectedDocument,
                                onRemove: isDeleting
                                    ? null
                                    : () => _deleteDocument(
                                          context,
                                          requirementId,
                                        ),
                              ),
                            )
                          else
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                IgnorePointer(
                                  ignoring: isLoading,
                                  child: DocumentSection(
                                    title: document.name ?? '',
                                    image: null,
                                    onTap: () =>
                                        _pickDocument(context, document),
                                    uploadLabel: context
                                        .loc.complete_requirements_upload,
                                    uploadHint: _uploadHint(context, document),
                                    paddingTop: AppPaddingHeight.p12,
                                  ),
                                ),
                                if (isLoading)
                                  const CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                              ],
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
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
        child: CustomElevatedButton(
          width: double.infinity,
          height: AppHeight.h52,
          color: AppColors.primary,
          borderRadius: AppRadius.r12,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                color: AppColors.white,
                size: AppSize.s22,
              ),
              SizedBox(width: AppWidth.w8),
              BodyTitle(
                text: context.loc.complete_requirements_confirm,
                color: AppColors.white,
                fontSize: AppFontSize.s16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _uploadHint(BuildContext context, RequiredDocumentModel? document) {
    final maxSize =
        document?.maxSize ?? AppFileConstraints.maxDocumentSizeInBytes;
    final acceptedTypes = document?.acceptedTypes?.isNotEmpty == true
        ? document!.acceptedTypes!
        : AppFileConstraints.documentExtensions;
    final sizeInMegabytes = maxSize / (1024 * 1024);
    final formattedSize = sizeInMegabytes == sizeInMegabytes.roundToDouble()
        ? sizeInMegabytes.toInt().toString()
        : sizeInMegabytes.toStringAsFixed(1);
    final extensions = acceptedTypes
        .map((type) => type.split('/').last.toUpperCase())
        .join('-');

    return context.loc.complete_requirements_upload_hint(
      formattedSize,
      extensions,
    );
  }
}

enum _DocumentSource { file, image }
