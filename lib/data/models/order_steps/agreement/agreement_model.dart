part of '../order_steps_model.dart';

@JsonSerializable(createToJson: false)
class AgreementModel extends Equatable {
  AgreementModel({required this.id, required this.label});

  final String? id;
  final String? label;

  factory AgreementModel.fromJson(Map<String, dynamic> json) =>
      _$AgreementModelFromJson(json);

  @override
  List<Object?> get props => [id, label];
}
