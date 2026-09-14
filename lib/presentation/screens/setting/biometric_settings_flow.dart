import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/presentation/cubit/setting/setting_cubit.dart';
import 'package:forsan/presentation/screens/setting/bottom_sheets/biometric_activation_sheet.dart';
import 'package:forsan/presentation/screens/setting/bottom_sheets/biometric_verification_sheet.dart';
import 'package:forsan/presentation/widgets/biometric_app_lock_gate.dart';

Future<void> handleBiometricsChanged(
  BuildContext context,
  bool value,
) async {
  final cubit = context.read<SettingCubit>();
  if (!value) {
    await cubit.setBiometricsEnabled(false);
    if (context.mounted) {
      BiometricAppLockGate.syncPreference(context, enabled: false);
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
    BiometricAppLockGate.syncPreference(context, enabled: true);
  } else {
    cubit.resetBiometricSwitch();
  }
}
