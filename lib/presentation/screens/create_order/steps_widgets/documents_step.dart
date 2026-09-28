import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_info_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_section_header.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';
import 'package:forsan/presentation/screens/create_order/widgets/document_requirement_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/uploaded_document_card.dart';
import 'package:forsan/presentation/widgets/document/document_section.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class DocumentsStep extends StatelessWidget {
  const DocumentsStep({super.key, required this.step});

  final StepModel step;

  Future<void> _pickDocuments(BuildContext context) async {
    final rejectedDocuments = await context.read<NewOrderCubit>().pickDocuments();

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

  @override
  Widget build(BuildContext context) {
    final sections = step.sections ?? const <Section>[];

    return BlocBuilder<NewOrderCubit, NewOrderState>(
      buildWhen: (previous, current) => previous.documents != current.documents,
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
          DocumentRequirementCard(
            title: fileFields[index].label?.trim() ?? '',
            availability: fileFields[index].required == true
                ? context.loc.new_order_document_required_when_available
                : context.loc.new_order_document_if_available,
            icon: _fileIcon(fileFields[index].id, index),
          ),
          if (index < fileFields.length - 1) SizedBox(height: AppHeight.h10),
        ],
        if (fileFields.isNotEmpty) ...[
          SizedBox(height: AppHeight.h24),
          SectionTitle(
            text: context.loc.new_order_attachments,
            color: AppColors.mainText,
            fontSize: AppFontSize.s14,
            textAlign: TextAlign.start,
          ),
          DocumentSection(
            image: null,
            onTap: () => _pickDocuments(context),
            paddingTop: AppPaddingHeight.p1,
            uploadLabel: context.loc.new_order_upload_tap,
            uploadHint: _uploadHint(context, fileFields),
          ),
          if (state.documents.isNotEmpty) ...[
            SizedBox(height: AppHeight.h20),
            for (final document in state.documents)
              Padding(
                padding: EdgeInsets.only(bottom: AppPaddingHeight.p16),
                child: UploadedDocumentCard(
                  document: document,
                  onRemove: () => context
                      .read<NewOrderCubit>()
                      .removeDocument(document),
                ),
              ),
          ],
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
    final extensions = acceptedTypes.map((type) => type.toUpperCase()).join(', ');

    return '$formattedSize MB - $extensions';
  }

}
