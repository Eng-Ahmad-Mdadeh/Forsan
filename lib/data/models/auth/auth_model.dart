import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthModel extends Equatable {
  AuthModel({
    required this.challengeId,
    required this.channel,
    required this.maskedPhone,
    required this.codeLength,
    required this.expiresIn,
    required this.resendIn,
    required this.devCode,
    required this.accessToken,
    required this.accessTokenExpiresIn,
    required this.refreshToken,
    required this.refreshTokenExpiresIn,
    required this.isNewUser,
    required this.user,
  });

  final String? challengeId;
  final String? channel;
  final String? maskedPhone;
  final int? codeLength;
  final int? expiresIn;
  final int? resendIn;
  final String? devCode;
  final String? accessToken;
  final int? accessTokenExpiresIn;
  final String? refreshToken;
  final int? refreshTokenExpiresIn;
  final bool? isNewUser;
  final User? user;

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

  @override
  List<Object?> get props => [
    challengeId, channel, maskedPhone, codeLength, expiresIn, resendIn, devCode, accessToken, accessTokenExpiresIn, refreshToken, refreshTokenExpiresIn, isNewUser, user, ];
}

@JsonSerializable(createToJson: false)
class User extends Equatable {
  User({
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
  final dynamic fullName;
  final dynamic email;
  final dynamic country;
  final dynamic countryName;
  final dynamic nationality;
  final dynamic nationalityName;
  final dynamic avatarUrl;
  final bool? profileComplete;
  final Settings? settings;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

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
