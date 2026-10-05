import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/helper/file_picker_helper.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/document_details/document_details_model.dart';
import 'package:forsan/presentation/bloc/file/upload_file/upload_file_bloc.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';
import 'package:forsan/presentation/screens/create_order/widgets/uploaded_document_card.dart';
import 'package:forsan/presentation/widgets/document/document_section.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class CompleteRequirementsDocuments extends StatelessWidget {
  const CompleteRequirementsDocuments({
    super.key,
    required this.documents,
    required this.uploadedFileIds,
    required this.onPickDocument,
    required this.onFileUploaded,
    required this.onUploadFailed,
  });

  final List<RequiredDocumentModel> documents;
  final Map<String, String?> uploadedFileIds;
  final ValueChanged<RequiredDocumentModel> onPickDocument;
  final void Function(String requirementId, String? fileId) onFileUploaded;
  final void Function(String requirementId, String message) onUploadFailed;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SectionTitle(
        text: context.loc.complete_requirements_documents_title,
        fontSize: AppSize.s16,
      ),
      BlocConsumer<UploadFileBloc, IUploadFileState>(
        listener: (context, uploadState) {
          if (uploadState is UploadFileLoaded) {
            onFileUploaded(
              uploadState.requirementId,
              uploadState.response?.data?.id,
            );
          } else if (uploadState is UploadFileFailed) {
            onUploadFailed(uploadState.requirementId, uploadState.message);
          }
        },
        builder: (context, uploadState) =>
            BlocBuilder<NewOrderCubit, NewOrderState>(
              builder: (context, orderState) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final document = documents[index];
                  final requirementId = document.id?.trim() ?? '';
                  final selectedDocument = orderState
                      .orderEntity.requirementDocuments[requirementId];
                  final isLoading = uploadState is UploadFileLoading &&
                      uploadState.requirementId == requirementId;
                  final isUploaded = uploadedFileIds.containsKey(requirementId);

                  if (isUploaded && selectedDocument != null) {
                    return Padding(
                      padding: EdgeInsets.only(top: AppPaddingHeight.p12),
                      child: UploadedDocumentCard(
                        document: selectedDocument,
                        onRemove: null,
                      ),
                    );
                  }

                  return DocumentSection(
                    title: document.name ?? '',
                    image: null,
                    isLoading: isLoading,
                    isEnabled: !isLoading,
                    onTap: () => onPickDocument(document),
                    uploadLabel: context.loc.complete_requirements_upload,
                    uploadHint: FilePickerHelper.buildUploadHint(
                      maxSize: document.maxSize,
                      acceptedTypes: document.acceptedTypes,
                      extensionSeparator: '-',
                      formatter: (formattedSize, extensions) => context.loc
                          .complete_requirements_upload_hint(
                            formattedSize,
                            extensions,
                          ),
                    ),
                    paddingTop: AppPaddingHeight.p12,
                  );
                },
              ),
            ),
      ),
    ],
  );
}
