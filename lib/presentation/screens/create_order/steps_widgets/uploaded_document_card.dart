import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class UploadedDocumentCard extends StatelessWidget {
  const UploadedDocumentCard({
    super.key,
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
