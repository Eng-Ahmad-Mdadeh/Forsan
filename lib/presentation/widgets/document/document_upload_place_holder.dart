import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';
import '../image_view.dart';
import '../text/body_title.dart';
import '../text/section_title.dart';

class DocumentUploadPlaceholder extends StatelessWidget {
  final String? image;
  final bool isExpanded;
  final bool isVideo;
  final VoidCallback? onRemove;
  final String? uploadLabel;
  final String? uploadHint;

  const DocumentUploadPlaceholder({
    super.key,
    required this.image,
    required this.isExpanded,
    this.isVideo = false,
    this.onRemove,
    this.uploadLabel,
    this.uploadHint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      height: isExpanded ? AppHeight.h250 : AppHeight.h150,
      width: double.infinity,
      child: image != null
          ? Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: AppPaddingHeight.p13),
                  child: ImageView(
                    imagePath: image!,
                    height: isExpanded ? AppHeight.h210 : AppHeight.h110,
                    width: double.infinity,
                    radius: BorderRadius.circular(AppRadius.r15),
                    fit: isExpanded ? BoxFit.cover : BoxFit.fitWidth,
                  ),
                ),
                if (onRemove != null)
                  Positioned(
                    top: AppPaddingHeight.p6,
                    right: AppPaddingWidth.p6,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Iconsax.close_circle_outline,
                        color: AppColors.red,
                      ),
                      onPressed: onRemove,
                    ),
                  ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isVideo
                      ? Iconsax.video_vertical_outline
                      : Icons.file_upload_outlined,
                  color: AppColors.mainText,
                  size: AppSize.s38,
                ),
                SizedBox(height: AppHeight.h7),
                SectionTitle(
                  text: uploadLabel ?? (isVideo ? "أضف فيديو" : "أضف صورة"),
                  color: AppColors.mainText,
                  fontWeight: AppFontWeight.regular,
                ),
                if (uploadHint != null) ...[
                  SizedBox(height: AppHeight.h7),
                  BodyTitle(
                    text: uploadHint,
                    color: AppColors.grey,
                    fontWeight: AppFontWeight.regular,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
    );
  }
}
