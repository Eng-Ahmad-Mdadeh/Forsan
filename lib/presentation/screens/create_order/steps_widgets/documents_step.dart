import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/bloc/create_order/upload_file/upload_file_bloc.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_info_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_section_header.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';
import 'package:forsan/presentation/screens/create_order/widgets/document_requirement_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/uploaded_document_card.dart';
import 'package:forsan/presentation/widgets/document/document_section.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:mime/mime.dart';

class DocumentsStep extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final StepModel step;

  const DocumentsStep({super.key, required this.formKey, required this.step});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UploadFileBloc>(create: (_) => UploadFileBloc()),
      ],
      child: BodyDocumentsStep(formKey: formKey, step: step),
    );
  }
}

class BodyDocumentsStep extends StatefulWidget {
  const BodyDocumentsStep({
    super.key,
    required this.formKey,
    required this.step,
  });

  final GlobalKey<FormState> formKey;
  final StepModel step;

  @override
  State<BodyDocumentsStep> createState() => _DocumentsStepState();
}

class _DocumentsStepState extends State<BodyDocumentsStep> {
  String? _expandedRequirementId;

  Future<void> _pickDocument(
    BuildContext context,
    String requirementId,
    List<String> acceptedTypes,
    int maxSize,
  ) async {
    final normalizedTypes = acceptedTypes
        .map((type) => type.toLowerCase())
        .toSet();
    final imageTypes = normalizedTypes
        .where(
          (type) => lookupMimeType('file.$type')?.startsWith('image/') == true,
        )
        .toSet();
    final fileTypes = normalizedTypes.difference(imageTypes);
    final source = fileTypes.isNotEmpty && imageTypes.isNotEmpty
        ? await _selectDocumentSource(context)
        : imageTypes.isNotEmpty
        ? _DocumentSource.image
        : _DocumentSource.file;
    if (!context.mounted || source == null) return;

    final cubit = context.read<NewOrderCubit>();
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

    if (!context.mounted || rejectedDocuments == 0) return;

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

  @override
  Widget build(BuildContext context) {
    final sections = widget.step.sections ?? const <Section>[];

    return Form(
      key: widget.formKey,
      child: BlocBuilder<NewOrderCubit, NewOrderState>(
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
          itemBuilder: (_, index) =>
              _buildSection(context, sections[index], state),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    Section section,
    NewOrderState state,
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
          _buildDocumentRequirement(context, fileFields[index], index, state),
          if (index < fileFields.length - 1) SizedBox(height: AppHeight.h10),
        ],
        for (final field in infoFields) ...[
          SizedBox(height: AppHeight.h26),
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
            onTap: () => setState(() {
              _expandedRequirementId = isExpanded ? null : requirementId;
            }),
          ),
          if (document != null) ...[
            SizedBox(height: AppHeight.h10),
            UploadedDocumentCard(
              document: document,
              onRemove: () => context
                  .read<NewOrderCubit>()
                  .removeDocumentForRequirement(requirementId),
            ),
          ] else if (isExpanded) ...[
            SizedBox(height: AppHeight.h10),
            DocumentSection(
              image: null,
              onTap: () =>
                  _pickDocument(context, requirementId, acceptedTypes, maxSize),
              paddingTop: AppPaddingHeight.p1,
              uploadLabel: context.loc.new_order_upload_tap,
              uploadHint: _uploadHint(context, [field]),
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

  String _uploadHint(BuildContext context, List<SectionField> fields) {
    final validation = fields.first.validation;
    final maxSize = validation?.maxSize;
    final acceptedTypes = validation?.acceptedTypes ?? const <String>[];
    if (maxSize == null || acceptedTypes.isEmpty) {
      return context.loc.new_order_upload_hint;
    }

    final sizeInMegabytes = maxSize / (1024 * 1024);
    final formattedSize = sizeInMegabytes == sizeInMegabytes.roundToDouble()
        ? sizeInMegabytes.toInt().toString()
        : sizeInMegabytes.toStringAsFixed(1);
    final extensions = acceptedTypes
        .map((type) => type.toUpperCase())
        .join(', ');

    return '$formattedSize MB - $extensions';
  }
}

enum _DocumentSource { file, image }
