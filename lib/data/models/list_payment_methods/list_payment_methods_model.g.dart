// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_payment_methods_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPaymentMethodsModel _$ListPaymentMethodsModelFromJson(
  Map<String, dynamic> json,
) => ListPaymentMethodsModel(
  code: json['code'] as String?,
  name: json['name'] as String?,
  logoUrl: json['logoUrl'],
  instructions: json['instructions'] as String?,
  account: json['account'] == null
      ? null
      : Account.fromJson(json['account'] as Map<String, dynamic>),
  fields: (json['fields'] as List<dynamic>?)
      ?.map((e) => Field.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
  iban: json['iban'] as String?,
  bankName: json['bankName'] as String?,
  accountNumber: json['accountNumber'] as String?,
  beneficiaryName: json['beneficiaryName'] as String?,
  receiverCity: json['receiverCity'] as String?,
  receiverName: json['receiverName'] as String?,
  receiverCountry: json['receiverCountry'] as String?,
  walletNumber: json['walletNumber'] as String?,
);

Field _$FieldFromJson(Map<String, dynamic> json) => Field(
  name: json['name'] as String?,
  label: json['label'] as String?,
  required: json['required'] as bool?,
);
