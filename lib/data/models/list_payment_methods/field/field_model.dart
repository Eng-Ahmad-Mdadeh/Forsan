part of '../list_payment_methods_model.dart';

@JsonSerializable(createToJson: false)
class Field extends Equatable {
  Field({
    required this.name,
    required this.label,
    required this.required,
  });

  final String? name;
  final String? label;
  final bool? required;

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);

  @override
  List<Object?> get props => [
    name, label, required, ];
}
