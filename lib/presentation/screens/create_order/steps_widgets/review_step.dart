import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class ReviewStep extends StatelessWidget {
  const ReviewStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p8,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Iconsax.main_component_outline,
                size: AppSize.s16,
                color: AppColors.secondary,
              ),
              SizedBox(width: AppWidth.w4),
              Expanded(
                child: SectionTitle(
                  text: 'راجع طلبك قبل الارسال',
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h8),
          BodyTitle(
            text:'يمكنك العودة لأي مرحلة وتعديل المعلومات قبل إرسال الطلب لفريق فرسان.',
            color: AppColors.secondaryText,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
            maxLines: 2,
          ),
          SizedBox(height: AppHeight.h8),
        ],
      ),
    );
  }
}
