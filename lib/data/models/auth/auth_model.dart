import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthModel extends Equatable {
  const AuthModel({
    this.accessToken,
    this.challengeId,
    this.expiresIn,
    this.devCode,
    this.user,
  });

  final String? accessToken;
  final String? challengeId;
  final int? expiresIn;
  final String? devCode;
  final User? user;

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

  @override
  List<Object?> get props => [accessToken, challengeId, expiresIn, devCode, user];
}

@JsonSerializable(createToJson: false)
class User extends Equatable {
  const User({
    this.id,
    this.phone,
    this.fullName,
    this.role,
  });

  final String? id;
  final String? phone;
  final String? fullName;
  final String? role;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  List<Object?> get props => [id, phone, fullName, role];
}
