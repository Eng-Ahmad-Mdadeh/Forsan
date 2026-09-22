// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
  challengeId: json['challengeId'] as String?,
  channel: json['channel'] as String?,
  maskedPhone: json['maskedPhone'] as String?,
  codeLength: (json['codeLength'] as num?)?.toInt(),
  expiresIn: (json['expiresIn'] as num?)?.toInt(),
  resendIn: (json['resendIn'] as num?)?.toInt(),
  devCode: json['devCode'] as String?,
  accessToken: json['accessToken'] as String?,
  accessTokenExpiresIn: (json['accessTokenExpiresIn'] as num?)?.toInt(),
  refreshToken: json['refreshToken'] as String?,
  refreshTokenExpiresIn: (json['refreshTokenExpiresIn'] as num?)?.toInt(),
  isNewUser: json['isNewUser'] as bool?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
);

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String?,
  phone: json['phone'] as String?,
  fullName: json['fullName'],
  email: json['email'],
  country: json['country'],
  countryName: json['countryName'],
  nationality: json['nationality'],
  nationalityName: json['nationalityName'],
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
