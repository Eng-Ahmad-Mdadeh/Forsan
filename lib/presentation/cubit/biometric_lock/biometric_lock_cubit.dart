import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/biometric_lock_service.dart';
import 'biometric_lock_state.dart';

class BiometricLockCubit extends Cubit<BiometricLockState> {
  BiometricLockCubit({BiometricLockService? service})
    : _service = service ?? BiometricLockService(), super(const BiometricLockState());
  final BiometricLockService _service;
  Future<void> unlockIfEnabled({required String reason}) async { if (await _service.isEnabled()) { emit(const BiometricLockState(isLocked: true)); await unlock(reason: reason); } }
  Future<void> lockIfEnabled() async { if (await _service.isEnabled()) emit(const BiometricLockState(isLocked: true)); }
  Future<void> unlock({required String reason}) async {
    emit(const BiometricLockState(isLocked: true, isAuthenticating: true));
    final authenticated = await _service.authenticate(reason: reason);
    emit(BiometricLockState(isLocked: !authenticated));
  }
}
