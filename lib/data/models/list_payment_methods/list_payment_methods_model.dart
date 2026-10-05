import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_payment_methods_model.g.dart';
part 'account/account_model.dart';
part 'field/field_model.dart';

@JsonSerializable(createToJson: false)
class ListPaymentMethodsModel extends Equatable {
  ListPaymentMethodsModel({
    required this.code,
    required this.name,
    required this.logoUrl,
    required this.instructions,
    required this.account,
    required this.fields,
  });

  final String? code;
  final String? name;
  final dynamic logoUrl;
  final String? instructions;
  final Account? account;
  final List<Field>? fields;

  factory ListPaymentMethodsModel.fromJson(Map<String, dynamic> json) => _$ListPaymentMethodsModelFromJson(json);

  @override
  List<Object?> get props => [
    code, name, logoUrl, instructions, account, fields, ];
}


