part of '../order_steps_model.dart';

@JsonSerializable(createToJson: false)
class Agreement extends Equatable {
  Agreement({required this.id, required this.label});

  final String? id;
  final String? label;

  factory Agreement.fromJson(Map<String, dynamic> json) =>
      _$AgreementFromJson(json);

  @override
  List<Object?> get props => [id, label];
}
