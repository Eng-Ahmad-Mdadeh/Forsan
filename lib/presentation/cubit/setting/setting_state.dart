import 'package:equatable/equatable.dart';

enum SettingLanguage { arabic, english }

class SettingState extends Equatable {
  const SettingState({
    this.notificationsEnabled = true,
    this.biometricsEnabled = false,
    this.language = SettingLanguage.arabic,
  });

  final bool notificationsEnabled;
  final bool biometricsEnabled;
  final SettingLanguage language;

  SettingState copyWith({
    bool? notificationsEnabled,
    bool? biometricsEnabled,
    SettingLanguage? language,
  }) => SettingState(
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    biometricsEnabled: biometricsEnabled ?? this.biometricsEnabled,
    language: language ?? this.language,
  );

  @override
  List<Object> get props => [
    notificationsEnabled,
    biometricsEnabled,
    language,
  ];
}
