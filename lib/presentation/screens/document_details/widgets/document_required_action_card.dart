import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/status_pill.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';

class DocumentRequiredActionCard extends StatelessWidget {
  const DocumentRequiredActionCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(AppPaddingWidth.p14),
    decoration: BoxDecoration(
      color: AppColors.secondaryLightHover,
      borderRadius: BorderRadius.circular(AppRadius.r12),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.info_outline_rounded,
          color: AppColors.secondaryNormal,
          size: AppSize.s20,
        ),
        SizedBox(width: AppWidth.w8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                text: 'إجراء مطلوب',
                color: AppColors.mainText,
                fontSize: AppFontSize.s13,
              ),
              SizedBox(height: AppHeight.h6),
              BodyTitle(
                text: 'يرجى إرفاق المستندات المطلوبة لاستكمال الطلب.',
                color: AppColors.blackCow,
                fontSize: AppFontSize.s11,
                fontWeight: AppFontWeight.regular,
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: AppHeight.h10),
              Pill(
                label: 'استكمال المتطلبات',
                background: AppColors.secondaryNormal,
                foreground: AppColors.white,
                icon: Icons.file_upload_outlined,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
