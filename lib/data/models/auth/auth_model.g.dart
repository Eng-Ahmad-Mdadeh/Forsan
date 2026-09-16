// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
  accessToken: json['accessToken'] as String?,
  challengeId: json['challengeId'] as String?,
  expiresIn: (json['expiresIn'] as num?)?.toInt(),
  id: json['id'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  fullName: json['fullName'] as String?,
  fatherName: json['fatherName'] as String?,
  nationality: json['nationality'] as String?,
  country: json['country'] as String?,
  city: json['city'] as String?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
);

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String?,
  phone: json['phone'] as String?,
  fullName: json['fullName'] as String?,
  role: json['role'] as String?,
);
