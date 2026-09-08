import 'package:equatable/equatable.dart';

class BiometricLockState extends Equatable {
  const BiometricLockState({this.isLocked = false, this.isAuthenticating = false});
  final bool isLocked;
  final bool isAuthenticating;
  @override List<Object?> get props => [isLocked, isAuthenticating];
}
