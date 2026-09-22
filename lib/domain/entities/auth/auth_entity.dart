import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

class AuthEntity extends Equatable {
  final String? phone;
  final String? fullName;
  final String? email;
  final String? country;
  final String? city;
  final String? fatherName;
  final String? passportNumber;
  final String? nationality;
  final String? whatsapp;
  final String? nationalId;
  final String? typeMessage;
  final String? code;
  final String? challengeId;
  final String? fcm;
  final bool? rememberMe;

  const AuthEntity({
    this.phone,
    this.typeMessage,
    this.code,
    this.challengeId,
    this.fcm,
    this.rememberMe,
    this.fullName,
    this.email,
    this.country,
    this.city,
    this.fatherName,
    this.passportNumber,
    this.nationality,
    this.whatsapp,
    this.nationalId,
  });

  Map<String, dynamic> toJson() {
    return {
      if (phone != null) 'phone': phone,
      if (fullName != null) 'fullName': fullName,
      if (email != null) 'email': email,
      if (country != null) 'country': country,
      if (city != null) 'city': city,
      if (fatherName != null) 'fatherName': fatherName,
      if (passportNumber != null) 'passportNo': passportNumber,
      if (nationality != null) 'nationality': nationality,
      if (whatsapp != null) 'whatsapp': whatsapp,
      if (nationalId != null) 'nationalId': nationalId,
      if (typeMessage != null) 'type_message': typeMessage,
      if (code != null) 'code': code,
      if (challengeId != null) 'challengeId': challengeId,
      // if (code != null) 'code': "4441",
      if (fcm != null) 'fcm_token': fcm,
    };
  }

  @override
  List<Object?> get props => [
    phone,
    typeMessage,
    code,
    challengeId,
    fcm,
    fullName,
    email,
    country,
    city,
    fatherName,
    passportNumber,
    nationality,
    whatsapp,
    nationalId,
    rememberMe,
  ];
}
