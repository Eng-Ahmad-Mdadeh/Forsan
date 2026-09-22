import 'package:equatable/equatable.dart';
import 'package:forsan/core/utils/enums/enum_utils.dart';

class AuthEntity extends Equatable {
  final String? phone;
  final String? fullName;
  final String? email;
  final CountryCode? country;
  final CountryCode? nationality;
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
    this.nationality,
  });

  Map<String, dynamic> toJson() {
    return {
      if (phone != null) 'phone': phone,
      if (fullName != null) 'fullName': fullName,
      if (email != null) 'email': email,
      if (country != null) 'country': country!.apiValue,
      if (nationality != null) 'nationality': nationality!.apiValue,
      if (typeMessage != null) 'channel': typeMessage,
      if (code != null) 'code': code,
      if (challengeId != null) 'challengeId': challengeId,
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
    nationality,
    rememberMe,
  ];
}
