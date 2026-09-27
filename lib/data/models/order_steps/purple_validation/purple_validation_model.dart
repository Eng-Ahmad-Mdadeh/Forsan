part of '../order_steps_model.dart';

@JsonSerializable(createToJson: false)
class PurpleValidation extends Equatable {
  PurpleValidation({required this.max, required this.min});

  final int? max;
  final int? min;

  factory PurpleValidation.fromJson(Map<String, dynamic> json) =>
      _$PurpleValidationFromJson(json);

  @override
  List<Object?> get props => [max, min];
}
