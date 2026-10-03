import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/helper/file_picker_helper.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/bloc/file/delete_file/delete_file_bloc.dart';
import 'package:forsan/presentation/bloc/file/upload_file/upload_file_bloc.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_info_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_section_header.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';
import 'package:forsan/presentation/screens/create_order/widgets/document_requirement_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/uploaded_document_card.dart';
import 'package:forsan/presentation/widgets/document/document_section.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class DocumentRequirementStep extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final StepModel step;

  const DocumentRequirementStep({
    super.key,
    required this.formKey,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UploadFileBloc>(create: (_) => UploadFileBloc()),
        BlocProvider<DeleteFileBloc>(create: (_) => DeleteFileBloc()),
      ],
      child: _BodyDocumentRequirementStep(
        formKey: formKey,
        step: step,
      ),
    );
  }
}

class _BodyDocumentRequirementStep extends StatefulWidget {
  const _BodyDocumentRequirementStep({
    super.key,
    required this.formKey,
    required this.step,
  });

  final GlobalKey<FormState> formKey;
  final StepModel step;

  @override
  State<_BodyDocumentRequirementStep> createState() =>
      _DocumentRequirementStepState();
}

class _DocumentRequirementStepState
    extends State<_BodyDocumentRequirementStep> {
  String? _expandedRequirementId;

  Future<void> _pickDocument(
    BuildContext context,
    String requirementId,
    List<String> acceptedTypes,
    int maxSize,
  ) async {
    if (context.read<UploadFileBloc>().state is UploadFileLoading) return;

    final cubit = context.read<NewOrderCubit>();
    final previousDocument =
        cubit.state.orderEntity.requirementDocuments[requirementId];
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
      final orderEntity = cubit.state.orderEntity.copyWith(
        requirementDocuments: {requirementId: selectedDocument},
      );
      context.read<UploadFileBloc>().add(
        UploadFileEvent(orderEntity, requirementId: requirementId),
      );
      return;
    }

    if (rejectedDocuments == 0) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: BodyTitle(
          text: context.loc.new_order_documents_size_error,
          color: AppColors.white,
          fontWeight: AppFontWeight.regular,
        ),
        backgroundColor: AppColors.red,
      ),
    );
  }

  void _deleteDocument(BuildContext context, String requirementId) {
    if (context.read<DeleteFileBloc>().state is DeleteFileLoading) return;

    context.read<DeleteFileBloc>().add(
      DeleteFileEvent(
        context.read<NewOrderCubit>().state.orderEntity,
        requirementId: requirementId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sections = widget.step.sections ?? const <Section>[];

    return Form(
      key: widget.formKey,
      child: BlocConsumer<DeleteFileBloc, IDeleteFileState>(
        listener: (context, deleteState) {
          if (deleteState is DeleteFileLoaded) {
            context.read<NewOrderCubit>().removeDocumentForRequirement(
              deleteState.requirementId,
            );
          }

          if (deleteState is DeleteFileFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: BodyTitle(
                  text: deleteState.message,
                  color: AppColors.white,
                  fontWeight: AppFontWeight.regular,
                ),
                backgroundColor: AppColors.red,
              ),
            );
          }
        },
        builder: (context, deleteState) =>
            BlocConsumer<UploadFileBloc, IUploadFileState>(
          listener: (context, uploadState) {
            if (uploadState is UploadFileLoaded) {
              context.read<NewOrderCubit>().setFileId(
                uploadState.response?.data?.id,
              );
            }

            if (uploadState is UploadFileFailed) {
              context.read<NewOrderCubit>().removeDocumentForRequirement(
                uploadState.requirementId,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: BodyTitle(
                    text: uploadState.message,
                    color: AppColors.white,
                    fontWeight: AppFontWeight.regular,
                  ),
                  backgroundColor: AppColors.red,
                ),
              );
            }
          },
          builder: (context, uploadState) =>
              BlocBuilder<NewOrderCubit, NewOrderState>(
            buildWhen: (previous, current) =>
                previous.orderEntity.requirementDocuments !=
                current.orderEntity.requirementDocuments,
            builder: (context, state) => ListView.separated(
              padding: EdgeInsets.fromLTRB(
                AppPaddingWidth.p16,
                AppPaddingHeight.p8,
                AppPaddingWidth.p16,
                AppPaddingHeight.p50,
              ),
              itemCount: sections.length,
              separatorBuilder: (_, _) => SizedBox(height: AppHeight.h24),
              itemBuilder: (_, index) => _buildSection(
                context,
                sections[index],
                state,
                uploadState,
                deleteState,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    Section section,
    NewOrderState state,
    IUploadFileState uploadState,
    IDeleteFileState deleteState,
  ) {
    final title = section.title?.trim() ?? '';
    final description = section.description?.trim() ?? '';
    final fields = section.fields ?? const <SectionField>[];
    final fileFields = fields.where((field) => field.type == 'file').toList();
    final infoFields = fields.where((field) => field.type == 'info').toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OrderSectionHeader(
          icon: Icons.file_upload_outlined,
          title: title,
          description: description,
        ),
        for (var index = 0; index < fileFields.length; index++) ...[
          _buildDocumentRequirement(
            context,
            fileFields[index],
            index,
            state,
            uploadState,
            deleteState,
          ),
          if (index < fileFields.length - 1) SizedBox(height: AppHeight.h8),
        ],
        for (final field in infoFields) ...[
          SizedBox(height: AppHeight.h8),
          OrderInfoCard(
            text: field.label?.trim() ?? '',
            backgroundColor: AppColors.goldBackGround,
            textColor: AppColors.mainText,
            iconColor: AppColors.mainText,
          ),
        ],
      ],
    );
  }

  Widget _buildDocumentRequirement(
    BuildContext context,
    SectionField field,
    int index,
    NewOrderState state,
    IUploadFileState uploadState,
    IDeleteFileState deleteState,
  ) {
    final requirementId = field.id?.trim().isNotEmpty == true
        ? field.id!.trim()
        : '${field.label ?? 'document'}-$index';
    final document = state.orderEntity.requirementDocuments[requirementId];
    final acceptedTypes =
        field.validation?.acceptedTypes ??
        AppFileConstraints.documentExtensions;
    final maxSize =
        field.validation?.maxSize ?? AppFileConstraints.maxDocumentSizeInBytes;
    final isExpanded = _expandedRequirementId == requirementId;
    final isLoading = uploadState is UploadFileLoading &&
        uploadState.requirementId == requirementId;
    final isDeleting = deleteState is DeleteFileLoading &&
        deleteState.requirementId == requirementId;

    return FormField<bool>(
      key: ValueKey('$requirementId-${document?.path}'),
      initialValue: document != null,
      validator: (hasDocument) => field.required == true && hasDocument != true
          ? context.loc.complete_profile_required_field
          : null,
      builder: (formField) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DocumentRequirementCard(
            title:
                '${field.label?.trim() ?? ''}${field.required == true ? ' *' : ''}',
            availability: field.required == true
                ? context.loc.new_order_document_required_when_available
                : context.loc.new_order_document_if_available,
            icon: _fileIcon(field.id, index),
            isLoading: isLoading,
            onTap: () => setState(() {
              _expandedRequirementId = isExpanded ? null : requirementId;
            }),
          ),
          if (document != null) ...[
            SizedBox(height: AppHeight.h10),
            UploadedDocumentCard(
              document: document,
              onRemove: isLoading || isDeleting
                  ? null
                  : () => _deleteDocument(context, requirementId),
            ),
          ] else if (isExpanded) ...[
            SizedBox(height: AppHeight.h10),
            DocumentSection(
              image: null,
              onTap: () =>
                  _pickDocument(context, requirementId, acceptedTypes, maxSize),
              paddingTop: AppPaddingHeight.p1,
              uploadLabel: context.loc.new_order_upload_tap,
              uploadHint: FilePickerHelper.buildUploadHint(
                maxSize: field.validation?.maxSize,
                acceptedTypes: field.validation?.acceptedTypes,
                fallbackText: context.loc.new_order_upload_hint,
                formatter: (formattedSize, extensions) =>
                    '$formattedSize MB - $extensions',
              ),
            ),
          ],
          if (formField.hasError) ...[
            SizedBox(height: AppHeight.h6),
            BodyTitle(
              text: formField.errorText!,
              color: AppColors.red,
              fontSize: AppFontSize.s12,
            ),
          ],
        ],
      ),
    );
  }

  IconData _fileIcon(String? fieldId, int index) {
    switch (fieldId) {
      case 'authorizationLetter':
        return Icons.add_moderator_outlined;
      case 'idCopy':
        return Icons.badge_outlined;
      case 'companyCertificate':
        return Icons.description_outlined;
      default:
        const icons = <IconData>[
          Icons.description_outlined,
          Icons.badge_outlined,
          Icons.insert_drive_file_outlined,
        ];
        return icons[index % icons.length];
    }
  }

}
