import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/presentation/cubit/setting/setting_cubit.dart';
import 'package:forsan/presentation/screens/setting/bottom_sheets/biometric_activation_sheet.dart';
import 'package:forsan/presentation/screens/setting/bottom_sheets/biometric_verification_sheet.dart';
import 'package:forsan/presentation/widgets/app_status_dialog.dart';
import 'package:forsan/presentation/widgets/biometric_app_lock_gate.dart';

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
    await AppStatusDialog.show(
      context,
      title: context.loc.biometric_activation_success_title,
      message: context.loc.biometric_activation_success_message,
      primaryButtonText: context.loc.biometric_activation_success_button,
    );
  } else {
    cubit.resetBiometricSwitch();
  }
}
