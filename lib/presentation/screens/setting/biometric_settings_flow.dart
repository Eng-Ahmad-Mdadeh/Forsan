import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/setting/setting_cubit.dart';
import 'package:forsan/presentation/screens/setting/bottom_sheets/biometric_activation_sheet.dart';
import 'package:forsan/presentation/screens/setting/bottom_sheets/biometric_verification_sheet.dart';
import 'package:forsan/presentation/widgets/biometric_app_lock_gate.dart';
import 'package:forsan/presentation/widgets/custom_animation_dialog.dart';
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
  return CustomAnimationDialog.showDialog(
    context,
    message: context.loc.biometric_activation_success_message,
    dialogType: DialogType.success,
    okText: context.loc.biometric_activation_success_button,
    okColor: AppColors.primary,
    dismissOnBackKeyPress: false,
    onOkPressed: () {},
    messageWidget: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionTitle(
          text: context.loc.biometric_activation_success_title,
          color: AppColors.primary,
          fontSize: AppFontSize.s20,
        ),
        SizedBox(height: AppHeight.h8),
        BodyTitle(
          text: context.loc.biometric_activation_success_message,
          color: AppColors.mainText,
          fontSize: AppFontSize.s16,
          fontWeight: AppFontWeight.regular,
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    ),
  );
}
