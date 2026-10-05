part of '../list_payment_methods_model.dart';

@JsonSerializable(createToJson: false)
class Account extends Equatable {
  Account({
    required this.iban,
    required this.bankName,
    required this.accountNumber,
    required this.beneficiaryName,
    required this.receiverCity,
    required this.receiverName,
    required this.receiverCountry,
    required this.walletNumber,
  });

  final String? iban;
  final String? bankName;
  final String? accountNumber;
  final String? beneficiaryName;
  final String? receiverCity;
  final String? receiverName;
  final String? receiverCountry;
  final String? walletNumber;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  @override
  List<Object?> get props => [
    iban, bankName, accountNumber, beneficiaryName, receiverCity, receiverName, receiverCountry, walletNumber, ];
}
