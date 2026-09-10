import 'package:flutter/material.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_fonts.dart';
import '../../core/resources/app_values.dart';
import 'custom_elevated_button.dart';
import 'text/body_title.dart';

class RequiredActionCard extends StatelessWidget {
  const RequiredActionCard({
    super.key,
    this.title,
    this.titleSpan,
    required this.message,
    required this.buttonText,
    required this.semanticsLabel,
    required this.onPressed,
    this.compact = false,
    this.illustration,
    this.buttonColor,
  }) : assert(
         (title == null) != (titleSpan == null),
         'Provide either title or titleSpan.',
       );

  final String? title;
  final InlineSpan? titleSpan;
  final String message;
  final String buttonText;
  final String semanticsLabel;
  final VoidCallback onPressed;
  final bool compact;
  final Widget? illustration;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment:
          compact ? CrossAxisAlignment.start : CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: AppColors.secondaryNormal,
              size: compact ? AppSize.s24 : AppSize.s30,
            ),
            SizedBox(width: compact ? AppWidth.w4 : AppWidth.w8),
            Expanded(child: _buildTitle()),
          ],
        ),
        SizedBox(height: compact ? AppHeight.h4 : AppHeight.h12),
        BodyTitle(
          text: message,
          color: AppColors.blackCow,
          maxLines: compact ? 2 : null,
          fontSize: compact ? AppFontSize.s12 : AppFontSize.s14,
          fontWeight: AppFontWeight.regular,
          height: compact ? 1.6 : null,
        ),
        SizedBox(height: compact ? AppHeight.h10 : AppHeight.h12),
        Align(
          alignment: compact
              ? AlignmentDirectional.centerStart
              : AlignmentDirectional.centerEnd,
          child: CustomElevatedButton(
            height: compact ? AppHeight.h35 : AppHeight.h48,
            onPressed: onPressed,
            color:
                buttonColor ??
                (compact ? AppColors.primary : AppColors.secondaryNormal),
            borderRadius: compact ? AppRadius.r8 : AppRadius.r12,
            padding: EdgeInsets.symmetric(
              horizontal:
                  compact ? AppPaddingWidth.p10 : AppPaddingWidth.p20,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.file_upload_outlined,
                  size: compact ? AppSize.s16 : AppSize.s22,
                  color: AppColors.white,
                ),
                SizedBox(width: AppWidth.w8),
                BodyTitle(
                  text: buttonText,
                  color: AppColors.white,
                  fontSize: compact ? AppFontSize.s12 : AppFontSize.s14,
                  fontWeight: AppFontWeight.medium,
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Semantics(
        container: true,
        label: semanticsLabel,
        child: Container(
          width: double.infinity,
          padding: compact
              ? EdgeInsets.symmetric(
                  horizontal: AppPaddingWidth.p12,
                  vertical: AppPaddingHeight.p12,
                )
              : EdgeInsets.fromLTRB(
                  AppPaddingWidth.p20,
                  AppPaddingHeight.p18,
                  AppPaddingWidth.p20,
                  AppPaddingHeight.p14,
                ),
          decoration: BoxDecoration(
            color: AppColors.secondaryLightHover,
            borderRadius: BorderRadius.circular(AppRadius.r20),
            boxShadow: [
              BoxShadow(
                color: AppColors.homeSoftShadow,
                blurRadius: AppRadius.r10,
                offset: Offset(0, AppHeight.h4),
              ),
            ],
          ),
          child: illustration != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: content),
                    SizedBox(width: AppWidth.w12),
                    illustration!,
                  ],
                )
              : content,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return BodyTitle(
      text: title,
      textSpan: titleSpan,
      color: AppColors.mainText,
      fontSize: compact ? AppFontSize.s12 : AppFontSize.s16,
      fontWeight: compact ? AppFontWeight.regular : AppFontWeight.bold,
    );
  }
}
