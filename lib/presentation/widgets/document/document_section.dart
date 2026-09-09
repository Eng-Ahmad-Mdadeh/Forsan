import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

import 'document_upload_place_holder.dart';

class DocumentSection extends StatelessWidget {
  final String? title;
  final String? supTitle;
  final String? image;
  final double? paddingTop;
  final double? paddingBottom;
  final VoidCallback onTap;
  final bool isExpanded;
  final bool isVideo;
  final bool isEnabled;
  final VoidCallback? onRemove;
  final String? uploadLabel;
  final String? uploadHint;

  const DocumentSection({
    super.key,
    this.title,
    this.supTitle,
    required this.onTap,
    required this.image,
    this.paddingTop,
    this.paddingBottom,
    this.isExpanded = false,
    this.isVideo = false,
    this.isEnabled = true,
    this.onRemove,
    this.uploadLabel,
    this.uploadHint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? AppPaddingHeight.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            BodyTitle(
              text: title,
            ),
          if (supTitle != null) ...[
            SizedBox(height: AppHeight.h3),
            BodyTitle(
              text: supTitle,
              overflow: TextOverflow.visible,
              fontWeight: AppFontWeight.regular,
              fontSize: AppFontSize.s14,
            ),
          ],
          SizedBox(height: AppHeight.h10),
          Container(
            decoration: BoxDecoration(
              color: AppColors.backGround,
              border: Border.all(color: AppColors.lightActive),
              borderRadius: BorderRadius.circular(AppRadius.r16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.r16),
              child: InkWell(
                splashColor: AppColors.none,
                highlightColor: AppColors.none,
                onTap: isEnabled ? onTap : null,
                child: DocumentUploadPlaceholder(
                  image: image,
                  isExpanded: isExpanded,
                  isVideo: isVideo,
                  onRemove: onRemove,
                  uploadLabel: uploadLabel,
                  uploadHint: uploadHint,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
