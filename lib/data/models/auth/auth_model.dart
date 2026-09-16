import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthModel extends Equatable {
  AuthModel({
    required this.accessToken,
    required this.challengeId,
    required this.expiresIn,
    required this.user,
  });

  final String? accessToken;
  final String? challengeId;
  final int? expiresIn;
  final User? user;

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

  @override
  List<Object?> get props => [
    accessToken, challengeId, expiresIn, user, ];
}

@JsonSerializable(createToJson: false)
class User extends Equatable {
  User({
    required this.id,
    required this.phone,
    required this.fullName,
    required this.role,
  });

  final String? id;
  final String? phone;
  final String? fullName;
  final String? role;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  List<Object?> get props => [
    id, phone, fullName, role, ];
}
