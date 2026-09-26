part of '../order_details_model.dart';


@JsonSerializable(createToJson: false)
class Customer extends Equatable {
  Customer({
    required this.id,
    required this.fullName,
    required this.phone,
  });

  final String? id;
  final String? fullName;
  final String? phone;

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  @override
  List<Object?> get props => [
    id, fullName, phone, ];
}
