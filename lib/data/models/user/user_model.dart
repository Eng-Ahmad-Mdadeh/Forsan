import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.uniqueId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.nationalId,
    required this.email,
    required this.profileCompleted,
    required this.emailVerified,
    required this.mediaFiles,
  });

  final String? id;

  @JsonKey(name: 'unique_id')
  final String? uniqueId;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? phone;

  @JsonKey(name: 'national_id')
  final dynamic nationalId;
  final dynamic email;

  @JsonKey(name: 'profile_completed')
  final bool? profileCompleted;

  @JsonKey(name: 'email_verified')
  final bool? emailVerified;

  @JsonKey(name: 'media_files')
  final Map<String, dynamic>? mediaFiles;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  List<Object?> get props => [
    id,
    uniqueId,
    firstName,
    lastName,
    phone,
    nationalId,
    email,
    profileCompleted,
    emailVerified,
    mediaFiles,
  ];
}
