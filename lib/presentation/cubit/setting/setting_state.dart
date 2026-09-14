import 'package:equatable/equatable.dart';

enum SettingLanguage { arabic, english }

class SettingState extends Equatable {
  const SettingState({
    this.notificationsEnabled = true,
    this.biometricsEnabled = false,
    this.biometricSwitchRevision = 0,
    this.language = SettingLanguage.arabic,
  });

  final bool notificationsEnabled;
  final bool biometricsEnabled;
  final int biometricSwitchRevision;
  final SettingLanguage language;

  SettingState copyWith({
    bool? notificationsEnabled,
    bool? biometricsEnabled,
    int? biometricSwitchRevision,
    SettingLanguage? language,
  }) => SettingState(
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    biometricsEnabled: biometricsEnabled ?? this.biometricsEnabled,
    biometricSwitchRevision:
        biometricSwitchRevision ?? this.biometricSwitchRevision,
    language: language ?? this.language,
  );

  @override
  List<Object> get props => [
    notificationsEnabled,
    biometricsEnabled,
    biometricSwitchRevision,
    language,
  ];
}
