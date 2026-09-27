part of '../order_steps_model.dart';

@JsonSerializable(createToJson: false)
class PurpleOption extends Equatable {
  PurpleOption({required this.label, required this.value});

  final String? label;
  final String? value;

  factory PurpleOption.fromJson(Map<String, dynamic> json) =>
      _$PurpleOptionFromJson(json);

  @override
  List<Object?> get props => [label, value];
}
