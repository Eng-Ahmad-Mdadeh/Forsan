import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/helper/download_file_helper.dart';
import 'package:forsan/data/models/document_details/document_details_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/presentation/bloc/file/download_file/download_file_bloc.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';

class AttachedDocumentsCard extends StatelessWidget {
  final List<AttachmentModel>? model;

  const AttachedDocumentsCard({super.key, this.model});

  @override
  Widget build(BuildContext context) => BlocProvider<DownloadFileBloc>(
    create: (_) => DownloadFileBloc(),
    child: _AttachedDocumentsBody(documents: model ?? const []),
  );
}

class _AttachedDocumentsBody extends StatelessWidget {
  const _AttachedDocumentsBody({required this.documents});

  final List<AttachmentModel> documents;

  Future<void> _saveDownloadedFile(
    BuildContext context,
    DownloadFileLoaded state,
  ) async {
    final attachment = documents.cast<AttachmentModel?>().firstWhere(
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('تم حفظ الملف بنجاح: $fileName')));
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
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
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
              const _AttachedDocumentsHeader(),
              SizedBox(height: AppHeight.h8),
              for (var index = 0; index < documents.length; index++) ...[
                _AttachedDocumentRow(document: documents[index]),
                if (index != documents.length - 1)
                  SizedBox(height: AppHeight.h8),
              ],
            ],
          ),
        ),
      );
}

class _AttachedDocumentsHeader extends StatelessWidget {
  const _AttachedDocumentsHeader();

  @override
  Widget build(BuildContext context) => Row(
    children: [
      _IconBox(
        width: AppWidth.w30,
        height: AppHeight.h30,
        icon: Icons.description_outlined,
        iconSize: AppSize.s17,
      ),
      SizedBox(width: AppWidth.w8),
      SectionTitle(
        text: 'المستندات المرفقة',
        color: AppColors.mainText,
        fontSize: AppFontSize.s14,
        fontWeight: AppFontWeight.bold,
      ),
    ],
  );
}

class _AttachedDocumentRow extends StatelessWidget {
  const _AttachedDocumentRow({required this.document});

  final AttachmentModel document;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: AppPaddingWidth.p8,
      vertical: AppPaddingHeight.p10,
    ),
    decoration: BoxDecoration(
      color: AppColors.backGround,
      borderRadius: BorderRadius.circular(AppRadius.r8),
    ),
    child: Row(
      children: [
        _IconBox(
          width: AppWidth.w40,
          height: AppHeight.h42,
          icon: Icons.insert_drive_file_outlined,
          iconSize: AppSize.s22,
        ),
        SizedBox(width: AppWidth.w8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyTitle(
                text: document.name ?? '',
                color: AppColors.mainText,
                fontSize: AppFontSize.s13,
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
        SizedBox(width: AppWidth.w8),
        Semantics(
          button: true,
          label: 'تحميل ${document.name ?? ''}',
          child: BlocBuilder<DownloadFileBloc, IDownloadFileState>(
            builder: (context, state) {
              final isDownloading =
                  state is DownloadFileLoading && state.fileId == document.id;
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
                borderRadius: BorderRadius.circular(AppRadius.r8),
                child: isDownloading
                    ? _LoadingIconBox()
                    : _IconBox(
                        width: AppWidth.w30,
                        height: AppHeight.h30,
                        icon: Icons.file_download_outlined,
                        iconSize: AppSize.s17,
                      ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

class _LoadingIconBox extends StatelessWidget {
  const _LoadingIconBox();

  @override
  Widget build(BuildContext context) => Container(
    width: AppWidth.w30,
    height: AppHeight.h30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.light,
      borderRadius: BorderRadius.circular(AppRadius.r8),
    ),
    child: SizedBox(
      width: AppSize.s16,
      height: AppSize.s16,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.primaryDark,
      ),
    ),
  );
}

class _IconBox extends StatelessWidget {
  const _IconBox({
    required this.width,
    required this.height,
    required this.icon,
    required this.iconSize,
  });

  final double width;
  final double height;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.light,
      borderRadius: BorderRadius.circular(AppRadius.r8),
    ),
    child: Icon(
      icon,
      color: AppColors.normal,
      size: iconSize,
    ),
  );
}
