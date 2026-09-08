// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String?,
  uniqueId: json['unique_id'] as String?,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  phone: json['phone'] as String?,
  nationalId: json['national_id'],
  email: json['email'],
  profileCompleted: json['profile_completed'] as bool?,
  emailVerified: json['email_verified'] as bool?,
  mediaFiles: json['media_files'] == null
      ? null
      : MediaFilesModel.fromJson(json['media_files'] as Map<String, dynamic>),
);
