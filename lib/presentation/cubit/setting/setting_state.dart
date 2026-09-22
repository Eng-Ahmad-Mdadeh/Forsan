import 'package:equatable/equatable.dart';

class SettingState extends Equatable {
  const SettingState({
    this.notificationsEnabled = true,
    this.biometricsEnabled = false,
    this.biometricSwitchRevision = 0,
  });

  final bool notificationsEnabled;
  final bool biometricsEnabled;
  final int biometricSwitchRevision;

  SettingState copyWith({
    bool? notificationsEnabled,
    bool? biometricsEnabled,
    int? biometricSwitchRevision,
  }) => SettingState(
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    biometricsEnabled: biometricsEnabled ?? this.biometricsEnabled,
    biometricSwitchRevision:
        biometricSwitchRevision ?? this.biometricSwitchRevision,
  );

  @override
  List<Object> get props => [
    notificationsEnabled,
    biometricsEnabled,
    biometricSwitchRevision,
  ];
}
