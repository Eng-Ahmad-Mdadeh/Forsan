// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  id: json['id'] as String?,
  phone: json['phone'] as String?,
  fullName: json['fullName'] as String?,
  email: json['email'] as String?,
  country: json['country'] as String?,
  countryName: json['countryName'] as String?,
  nationality: json['nationality'] as String?,
  nationalityName: json['nationalityName'] as String?,
  avatarUrl: json['avatarUrl'],
  profileComplete: json['profileComplete'] as bool?,
  settings: json['settings'] == null
      ? null
      : Settings.fromJson(json['settings'] as Map<String, dynamic>),
);

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
  notificationsEnabled: json['notificationsEnabled'] as bool?,
  language: json['language'] as String?,
);
