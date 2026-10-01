import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/helper/download_file_helper.dart';
import 'package:forsan/data/models/document_details/document_details_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/presentation/bloc/file/download_file/download_file_bloc.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/status_badge.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';

class DocumentListCard extends StatelessWidget {
  final DocumentDetailsModel? documents;

  const DocumentListCard({super.key, this.documents});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DownloadFileBloc>(create: (_) => DownloadFileBloc()),
      ],
      child: BodyDocumentListCard(documents: documents),
    );
  }
}

class BodyDocumentListCard extends StatelessWidget {
  BodyDocumentListCard({super.key, this.documents});

  final DocumentDetailsModel? documents;

  late final uploads = documents?.uploads ?? const <AttachmentModel>[];

  Future<void> _saveDownloadedFile(
    BuildContext context,
    DownloadFileLoaded state,
  ) async {
    final attachment = uploads.cast<AttachmentModel?>().firstWhere(
      (file) => file?.id == state.fileId,
      orElse: () => null,
    );
    final fileName = DownloadFileHelper.safeFileName(
      attachment?.name,
      state.fileId,
    );

    try {
      final savedPath = await DownloadFileHelper.saveFile(
        bytes: state.response,
        fileId: state.fileId,
        fileName: attachment?.name,
        dialogTitle: 'حفظ الملف',
      );

      if (!context.mounted || savedPath == null) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم حفظ الملف بنجاح: $fileName')),
      );
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تعذر حفظ الملف، يرجى المحاولة مرة أخرى')),
      );
    }
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<DownloadFileBloc, IDownloadFileState>(
    listener: (context, state) {
      if (state is DownloadFileLoaded) {
        _saveDownloadedFile(context, state);
      } else if (state is DownloadFileFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
    },
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppPaddingWidth.p10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.r12),

        boxShadow: [
          BoxShadow(
            color: AppColors.homeSoftShadow.withOpacity(0.05),
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
                text: 'مستندات الطلب',
                color: AppColors.mainText,
                fontSize: AppFontSize.s14,
                fontWeight: AppFontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: AppHeight.h8),

          for (var index = 0; index < uploads.length; index++) ...[
            _DocumentRow(document: uploads[index]),
            if (index != uploads.length - 1) SizedBox(height: AppHeight.h6),
          ],
        ],
      ),
    ),
  );
}

class _DocumentRow extends StatelessWidget {
  const _DocumentRow({required this.document});

  final AttachmentModel document;

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
          width: AppWidth.w40,
          height: AppHeight.h40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.circular(AppRadius.r7),
          ),
          child: Icon(
            Icons.insert_drive_file_outlined,
            color: AppColors.secondaryText,
            size: AppSize.s24,
          ),
        ),
        SizedBox(width: AppWidth.w8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyTitle(
                text: document.name ?? '',
                color: AppColors.blackText,
                fontSize: AppFontSize.s14,
                fontWeight: AppFontWeight.medium,
              ),
              SizedBox(height: AppHeight.h3),
              BodyTitle(
                text: document.size == null
                    ? ''
                    : '${(document.size! / (1024 * 1024)).toStringAsFixed(1)} ميجا بايت',
                color: AppColors.secondaryText,
                fontSize: AppFontSize.s10,
                fontWeight: AppFontWeight.regular,
              ),
            ],
          ),
        ),
        Column(
          children: [
            StatusBadge(
              status: document.status ?? '',
              fontSize: AppSize.s12,
              fontWeight: AppFontWeight.medium,
            ),
            SizedBox(height: AppHeight.h4),
            BlocBuilder<DownloadFileBloc, IDownloadFileState>(
              builder: (context, state) {
                final isDownloading =
                    state is DownloadFileLoading &&
                    state.fileId == document.id;
                return InkWell(
                  onTap: isDownloading
                      ? null
                      : () {
                          context.read<DownloadFileBloc>().add(
                            DownloadFileEvent(
                              CreateOrderEntity(fileId: document.id ?? ''),
                              fileId: document.id ?? '',
                            ),
                          );
                        },
                  borderRadius: BorderRadius.circular(AppRadius.r7),
                  child: Container(
                    width: AppWidth.w25,
                    height: AppHeight.h25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.light,
                      borderRadius: BorderRadius.circular(AppRadius.r7),
                    ),
                    child: isDownloading
                        ? SizedBox(
                            width: AppSize.s16,
                            height: AppSize.s16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primaryDark,
                            ),
                          )
                        : Icon(
                            Icons.file_download_outlined,
                            color: AppColors.primaryDark,
                            size: AppSize.s16,
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    ),
  );
}
