part of '../order_steps_model.dart';

@JsonSerializable(createToJson: false)
class FluffyOption extends Equatable {
  FluffyOption({
    required this.label,
    required this.value,
    required this.icon,
    required this.description,
  });

  final String? label;
  final String? value;
  final String? icon;
  final String? description;

  factory FluffyOption.fromJson(Map<String, dynamic> json) =>
      _$FluffyOptionFromJson(json);

  @override
  List<Object?> get props => [label, value, icon, description];
}
