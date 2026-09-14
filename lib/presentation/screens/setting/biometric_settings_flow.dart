import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/setting/setting_cubit.dart';
import 'package:forsan/presentation/screens/setting/bottom_sheets/biometric_activation_sheet.dart';
import 'package:forsan/presentation/screens/setting/bottom_sheets/biometric_verification_sheet.dart';
import 'package:forsan/presentation/widgets/biometric_app_lock_gate.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

Future<void> handleBiometricsChanged(
  BuildContext context,
  bool value,
) async {
  final cubit = context.read<SettingCubit>();
  if (!value) {
    await cubit.setBiometricsEnabled(false);
    if (context.mounted) {
      BiometricAppLockGate.of(context).disableLock();
    }
    return;
  }

  final shouldVerify = await showBiometricActivationSheet(context);
  if (!context.mounted) return;

  if (shouldVerify != true) {
    cubit.resetBiometricSwitch();
    return;
  }

  final activated = await showBiometricVerificationSheet(context, cubit);
  if (!context.mounted) return;

  if (activated) {
    await _showActivationSuccessDialog(context);
  } else {
    cubit.resetBiometricSwitch();
  }
}

Future<void> _showActivationSuccessDialog(BuildContext context) {
  return showGeneralDialog<void>(
    context: context,
    useRootNavigator: true,
    barrierDismissible: false,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: AppColors.black.withValues(alpha: 0.45),
    transitionDuration: AppDurations.navigationSelection,
    pageBuilder: (dialogContext, _, __) => PopScope(
      canPop: false,
      child: _ActivationSuccessDialog(
        title: context.loc.biometric_activation_success_title,
        message: context.loc.biometric_activation_success_message,
        buttonText: context.loc.biometric_activation_success_button,
        onDone: () => Navigator.of(dialogContext, rootNavigator: true).pop(),
      ),
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

class _ActivationSuccessDialog extends StatelessWidget {
  const _ActivationSuccessDialog({
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onDone,
  });

  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Material(
          color: AppColors.none,
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: AppWidth.w400),
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
                    AppPaddingWidth.p31,
                    AppPaddingHeight.p43,
                    AppPaddingWidth.p31,
                    AppPaddingHeight.p33,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _SuccessIcon(),
                      SizedBox(height: AppHeight.h44),
                      SectionTitle(
                        text: title,
                        color: AppColors.primary,
                        fontSize: AppFontSize.s24,
                        fontWeight: AppFontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppHeight.h8),
                      BodyTitle(
                        text: message,
                        color: AppColors.mainText,
                        fontSize: AppFontSize.s18,
                        fontWeight: AppFontWeight.regular,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        maxLines: 3,
                      ),
                      SizedBox(height: AppHeight.h48),
                      SizedBox(
                        width: double.infinity,
                        height: AppHeight.h55,
                        child: FilledButton(
                          onPressed: onDone,
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppRadius.r15,
                              ),
                            ),
                          ),
                          child: Text(
                            buttonText,
                            style: TextStyle(
                              fontFamily: AppFontFamily.tajawal,
                              fontSize: AppFontSize.s18,
                              fontWeight: AppFontWeight.medium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SuccessIcon extends StatelessWidget {
  const _SuccessIcon();

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
          color: AppColors.primary,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.secondary,
            width: AppWidth.w7,
          ),
        ),
        child: Icon(
          Icons.check_rounded,
          color: AppColors.secondary,
          size: AppSize.s50,
        ),
      ),
    );
  }
}
