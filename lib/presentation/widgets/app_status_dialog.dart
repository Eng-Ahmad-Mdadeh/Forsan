import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

/// A reusable dialog for status messages and confirmation actions.
class AppStatusDialog extends StatelessWidget {
  const AppStatusDialog({
    super.key,
    required this.title,
    required this.message,
    required this.primaryButtonText,
    this.onPrimaryPressed,
    this.secondaryButtonText,
    this.onSecondaryPressed,
    this.icon = Icons.check_rounded,
    this.iconColor = AppColors.secondary,
    this.iconBackgroundColor = AppColors.primary,
    this.iconBorderColor = AppColors.secondary,
    this.titleColor = AppColors.primary,
    this.primaryButtonColor = AppColors.primary,
    this.canDismiss = false,
  });

  final String title;
  final String message;
  final String primaryButtonText;
  final VoidCallback? onPrimaryPressed;
  final String? secondaryButtonText;
  final VoidCallback? onSecondaryPressed;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Color iconBorderColor;
  final Color titleColor;
  final Color primaryButtonColor;
  final bool canDismiss;

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    required String primaryButtonText,
    VoidCallback? onPrimaryPressed,
    String? secondaryButtonText,
    VoidCallback? onSecondaryPressed,
    IconData icon = Icons.check_rounded,
    Color iconColor = AppColors.secondary,
    Color iconBackgroundColor = AppColors.primary,
    Color iconBorderColor = AppColors.secondary,
    Color titleColor = AppColors.primary,
    Color primaryButtonColor = AppColors.primary,
    bool canDismiss = false,
  }) {
    return showGeneralDialog<void>(
      context: context,
      useRootNavigator: true,
      barrierDismissible: canDismiss,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: AppColors.black.withValues(alpha: 0.45),
      transitionDuration: AppDurations.navigationSelection,
      pageBuilder: (dialogContext, _, __) => AppStatusDialog(
        title: title,
        message: message,
        primaryButtonText: primaryButtonText,
        onPrimaryPressed: onPrimaryPressed,
        secondaryButtonText: secondaryButtonText,
        onSecondaryPressed: onSecondaryPressed,
        icon: icon,
        iconColor: iconColor,
        iconBackgroundColor: iconBackgroundColor,
        iconBorderColor: iconBorderColor,
        titleColor: titleColor,
        primaryButtonColor: primaryButtonColor,
        canDismiss: canDismiss,
      ),
      transitionBuilder: (_, animation, __, child) => FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.92, end: 1).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          ),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canDismiss,
      child: SafeArea(
        child: Center(
          child: Material(
            color: AppColors.none,
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(maxWidth: AppWidth.w370),
              margin: EdgeInsets.symmetric(horizontal: AppMarginWidth.m16),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppRadius.r18),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.035,
                      child: Image.asset(
                        AppAssets.appBackground,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppPaddingWidth.p12,
                      AppPaddingHeight.p23,
                      AppPaddingWidth.p12,
                      AppPaddingHeight.p18,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _StatusIcon(
                          icon: icon,
                          iconColor: iconColor,
                          backgroundColor: iconBackgroundColor,
                          borderColor: iconBorderColor,
                        ),
                        SizedBox(height: AppHeight.h24),
                        SectionTitle(
                          text: title,
                          color: titleColor,
                          fontSize: AppFontSize.s18,
                          fontWeight: AppFontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppHeight.h8),
                        BodyTitle(
                          text: message,
                          color: AppColors.black,
                          fontSize: AppFontSize.s16,
                          fontWeight: AppFontWeight.regular,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          maxLines: 3,
                        ),
                        SizedBox(height: AppHeight.h24),
                        _DialogButton(
                          text: primaryButtonText,
                          color: primaryButtonColor,
                          onPressed: () => _handleAction(
                            context,
                            onPrimaryPressed,
                          ),
                        ),
                        if (secondaryButtonText != null) ...[
                          SizedBox(height: AppHeight.h8),
                          _DialogButton(
                            text: secondaryButtonText!,
                            color: AppColors.white,
                            foregroundColor: primaryButtonColor,
                            borderColor: primaryButtonColor,
                            onPressed: () => _handleAction(
                              context,
                              onSecondaryPressed,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleAction(BuildContext context, VoidCallback? action) {
    if (action != null) {
      action();
      return;
    }
    Navigator.of(context, rootNavigator: true).pop();
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({
    required this.text,
    required this.color,
    required this.onPressed,
    this.foregroundColor = AppColors.white,
    this.borderColor,
  });

  final String text;
  final Color color;
  final Color foregroundColor;
  final Color? borderColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppWidth.w225,
      height: AppHeight.h48,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: color,
          foregroundColor: foregroundColor,
          side: borderColor == null ? null : BorderSide(color: borderColor!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: AppFontFamily.tajawal,
            fontSize: AppFontSize.s16,
            fontWeight: AppFontWeight.regular,
          ),
        ),
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  const _StatusIcon({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.borderColor,
  });

  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppWidth.w120,
      height: AppHeight.h120,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p18,
        vertical: AppPaddingHeight.p18,
      ),
      decoration: const BoxDecoration(
        color: AppColors.light,
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: AppWidth.w7),
        ),
        child: Icon(icon, color: iconColor, size: AppSize.s50),
      ),
    );
  }
}
