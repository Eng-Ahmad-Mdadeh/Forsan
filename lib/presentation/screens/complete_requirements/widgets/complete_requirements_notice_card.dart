import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class CompleteRequirementsNoticeCard extends StatelessWidget {
  const CompleteRequirementsNoticeCard({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) => SectionCard(
    backgroundColor: AppColors.secondaryLightHover,
    borderRadius: BorderRadius.circular(AppRadius.r20),
    padding: EdgeInsets.symmetric(
      horizontal: AppPaddingWidth.p16,
      vertical: AppPaddingHeight.p16,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: AppColors.secondaryNormal,
              size: AppSize.s30,
            ),
            SizedBox(width: AppWidth.w8),
            Expanded(
              child: SectionTitle(
                text: title,
                color: AppColors.mainText,
                fontSize: AppFontSize.s13,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: AppPaddingWidth.p35),
          child: BodyTitle(
            text: context.loc.complete_requirements_notice,
            color: AppColors.blackCow,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
            height: 1.8,
          ),
        ),
      ],
    ),
  );
}
