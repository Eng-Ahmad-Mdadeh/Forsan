import 'package:flutter/material.dart';

import '../../core/extension/localization_extension.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';
import '../../core/resources/app_fonts.dart';
import '../../core/resources/app_values.dart';
import '../../core/routes/app_routes.dart';
import 'custom_elevated_button.dart';
import 'image_view.dart';
import 'text/body_title.dart';

class RequiredActionCard extends StatelessWidget {
  const RequiredActionCard({
    super.key,
    this.orderNumber,
    this.message,
    this.compact = false,
    this.showIllustration = false,
    this.onPressed,
  });

  final String? orderNumber;
  final String? message;
  final bool compact;
  final bool showIllustration;
  final VoidCallback? onPressed;

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
            Expanded(child: _buildTitle(context)),
          ],
        ),
        SizedBox(height: compact ? AppHeight.h4 : AppHeight.h12),
        BodyTitle(
          text: message ?? context.loc.order_required_documents_message,
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
            onPressed:
                onPressed ?? () => CompleteRequirementsRoute().push(context),
            color: compact ? AppColors.primary : AppColors.secondaryNormal,
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
                  text: context.loc.order_complete_requirements,
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
        label: context.loc.order_required_action,
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
          child: showIllustration
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: content),
                    SizedBox(width: AppWidth.w12),
                    _buildIllustration(),
                  ],
                )
              : content,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final number = orderNumber;
    if (number == null) {
      return BodyTitle(
        text: context.loc.order_required_action,
        color: AppColors.mainText,
        fontSize: compact ? AppFontSize.s12 : AppFontSize.s16,
        fontWeight: compact ? AppFontWeight.regular : AppFontWeight.bold,
      );
    }

    return BodyTitle(
      textSpan: TextSpan(
        children: [
          const TextSpan(text: 'إجراء مطلوب على الطلب '),
          TextSpan(
            text: number,
            style: TextStyle(
              color: AppColors.mainText,
              fontWeight: AppFontWeight.bold,
              fontSize: AppFontSize.s12,
            ),
          ),
        ],
      ),
      color: AppColors.mainText,
      fontSize: AppFontSize.s12,
      fontWeight: AppFontWeight.regular,
    );
  }

  Widget _buildIllustration() => Semantics(
    image: true,
    label: 'شعار فرسان',
    child: SizedBox(
      width: AppWidth.w65,
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(
          AppColors.secondaryNormal,
          BlendMode.srcIn,
        ),
        child: ImageView(
          imagePath: AppAssets.addFile,
          fit: BoxFit.contain,
          excludeFromSemantics: true,
        ),
      ),
    ),
  );
}
