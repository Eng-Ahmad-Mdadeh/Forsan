import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable(createToJson: false)
class ProfileModel extends Equatable {
  ProfileModel({
    required this.id,
    required this.phone,
    required this.fullName,
    required this.email,
    required this.country,
    required this.countryName,
    required this.nationality,
    required this.nationalityName,
    required this.avatarUrl,
    required this.profileComplete,
    required this.settings,
  });

  final String? id;
  final String? phone;
  final String? fullName;
  final String? email;
  final String? country;
  final String? countryName;
  final String? nationality;
  final String? nationalityName;
  final dynamic avatarUrl;
  final bool? profileComplete;
  final Settings? settings;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  @override
  List<Object?> get props => [
    id, phone, fullName, email, country, countryName, nationality, nationalityName, avatarUrl, profileComplete, settings, ];
}

@JsonSerializable(createToJson: false)
class Settings extends Equatable {
  Settings({
    required this.notificationsEnabled,
    required this.language,
  });

  final bool? notificationsEnabled;
  final String? language;

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);

  @override
  List<Object?> get props => [
    notificationsEnabled, language, ];
}
