import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthModel extends Equatable {
  AuthModel({
    required this.accessToken,
    required this.challengeId,
    required this.expiresIn,
    required this.id,
    required this.phone,
    required this.email,
    required this.fullName,
    required this.fatherName,
    required this.nationality,
    required this.country,
    required this.city,
    required this.user,
  });

  final String? accessToken;
  final String? challengeId;
  final int? expiresIn;
  final String? id;
  final String? phone;
  final String? email;
  final String? fullName;
  final String? fatherName;
  final String? nationality;
  final String? country;
  final String? city;
  final User? user;

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

  @override
  List<Object?> get props => [
    accessToken, challengeId, expiresIn, id, phone, email, fullName, fatherName, nationality, country, city, user, ];
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
