import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';
import 'package:forsan/presentation/widgets/document/document_section.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class DocumentsStep extends StatelessWidget {
  const DocumentsStep({super.key});

  Future<void> _pickDocuments(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: AppFileConstraints.documentExtensions,
      allowMultiple: true,
    );

    if (result == null || !context.mounted) return;

    final validDocuments = result.files
        .where(
          (file) => file.size <= AppFileConstraints.maxDocumentSizeInBytes,
        )
        .toList();
    final hasOversizedDocument = validDocuments.length != result.files.length;

    context.read<NewOrderCubit>().addDocuments(validDocuments);

    if (hasOversizedDocument) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: BodyTitle(
            text: 'الحد الأقصى لحجم الملف هو 10 MB.',
            color: AppColors.white,
            fontWeight: AppFontWeight.regular,
          ),
          backgroundColor: AppColors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewOrderCubit, NewOrderState>(
      buildWhen: (previous, current) => previous.documents != current.documents,
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppPaddingWidth.p16,
            vertical: AppPaddingHeight.p8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(
                    Iconsax.activity_outline,
                    size: AppSize.s16,
                    color: AppColors.secondary,
                  ),
                  SizedBox(width: AppWidth.w4),
                  Expanded(
                    child: SectionTitle(
                      text: 'ارفاق الوثائق المتوفرة',
                      color: AppColors.primaryDark,
                      fontSize: AppFontSize.s14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppHeight.h8),
              BodyTitle(
                text:
                    'ليس من الضروري توفر جميع الوثائق الآن. ارفع المتوفر وسيحدد فريق فرسان النواقص بعد المراجعة.',
                color: AppColors.secondaryText,
                fontSize: AppFontSize.s12,
                fontWeight: AppFontWeight.regular,
                maxLines: 2,
              ),
              SizedBox(height: AppHeight.h16),
              const _DocumentCard(
                title: 'وكالة أو تفويض',
                availability: 'إن وجد',
                icon: Icons.assignment_ind_outlined,
              ),
              SizedBox(height: AppHeight.h10),
              const _DocumentCard(
                title: 'صورة الهوية / جواز السفر',
                availability: 'مطلوب عند توفره',
                icon: Icons.badge_outlined,
              ),
              SizedBox(height: AppHeight.h10),
              const _DocumentCard(
                title: 'مستند المقر',
                availability: 'إن وجد',
                icon: Icons.description_outlined,
              ),
              SizedBox(height: AppHeight.h24),
              SectionTitle(
                text: 'مرفقات',
                color: AppColors.mainText,
                fontSize: AppFontSize.s22,
                textAlign: TextAlign.right,
              ),
              SizedBox(height: AppHeight.h16),
              DocumentSection(
                image: null,
                onTap: () => _pickDocuments(context),
                paddingTop: AppPaddingHeight.p1,
                uploadLabel: 'اضغط للرفع',
                uploadHint: 'الحد الأقصى لكل ملف 10 MB - PDF, JPG, PNG',
              ),
              if (state.documents.isNotEmpty) ...[
                SizedBox(height: AppHeight.h20),
                ...state.documents.map(
                  (document) => Padding(
                    padding: EdgeInsets.only(bottom: AppPaddingHeight.p16),
                    child: _UploadedDocumentCard(
                      document: document,
                      onRemove: () => context
                          .read<NewOrderCubit>()
                          .removeDocument(document),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _DocumentCard extends StatelessWidget {
  const _DocumentCard({
    required this.title,
    required this.availability,
    required this.icon,
  });

  final String title;
  final String availability;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p18,
      ),
      borderRadius: BorderRadius.circular(AppRadius.r12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryDark, size: AppSize.s22),
          SizedBox(width: AppWidth.w12),
          Expanded(
            child: SectionTitle(
              text: title,
              color: AppColors.primaryDark,
              fontSize: AppFontSize.s16,
              fontWeight: AppFontWeight.medium,
              maxLines: 1,
            ),
          ),
          SizedBox(width: AppWidth.w12),
          BodyTitle(
            text: availability,
            color: AppColors.secondary,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.regular,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

class _UploadedDocumentCard extends StatelessWidget {
  const _UploadedDocumentCard({
    required this.document,
    required this.onRemove,
  });

  final PlatformFile document;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p16,
      ),
      borderRadius: BorderRadius.circular(AppRadius.r16),
      child: Row(
        children: [
          Icon(
            Icons.description_outlined,
            color: AppColors.primary,
            size: AppSize.s30,
          ),
          SizedBox(width: AppWidth.w12),
          Expanded(
            child: BodyTitle(
              text: document.name,
              color: AppColors.primary,
              fontSize: AppFontSize.s16,
              fontWeight: AppFontWeight.regular,
              maxLines: 1,
            ),
          ),
          SizedBox(width: AppWidth.w12),
          IconButton(
            tooltip: 'حذف المرفق',
            onPressed: onRemove,
            icon: Icon(
              Icons.delete_outline_rounded,
              color: AppColors.red,
              size: AppSize.s30,
            ),
          ),
        ],
      ),
    );
  }
}
