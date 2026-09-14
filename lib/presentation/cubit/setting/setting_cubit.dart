import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/biometric_lock_service.dart';
import 'package:forsan/presentation/cubit/setting/setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({BiometricLockService? biometricLockService})
    : _biometricLockService = biometricLockService ?? BiometricLockService(),
      super(const SettingState()) {
    _loadBiometricPreference();
  }

  final BiometricLockService _biometricLockService;

  void setNotificationsEnabled(bool value) {
    emit(state.copyWith(notificationsEnabled: value));
  }

  Future<void> setBiometricsEnabled(bool value) async {
    await _biometricLockService.setEnabled(value);
    if (isClosed) return;

    emit(state.copyWith(biometricsEnabled: value));
  }

  void resetBiometricSwitch() {
    if (isClosed) return;

    emit(
      state.copyWith(
        biometricSwitchRevision: state.biometricSwitchRevision + 1,
      ),
    );
  }

  Future<bool> activateBiometrics({required String reason}) async {
    try {
      if (!await _biometricLockService.canUseBiometrics()) return false;

      final authenticated = await _biometricLockService.authenticate(
        reason: reason,
      );
      if (!authenticated || isClosed) return false;

      await setBiometricsEnabled(true);
      return !isClosed && state.biometricsEnabled;
    } catch (_) {
      return false;
    }
  }

  void selectLanguage(SettingLanguage language) {
    if (state.language == language) return;

    emit(state.copyWith(language: language));
  }

  Future<void> _loadBiometricPreference() async {
    final isEnabled = await _biometricLockService.isEnabled();
    if (isClosed) return;

    emit(state.copyWith(biometricsEnabled: isEnabled));
  }
}
