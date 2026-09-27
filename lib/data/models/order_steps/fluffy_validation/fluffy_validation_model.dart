part of '../order_steps_model.dart';

@JsonSerializable(createToJson: false)
class FluffyValidation extends Equatable {
  FluffyValidation({
    required this.max,
    required this.min,
    required this.maxItems,
    required this.minItems,
    required this.maxSize,
    required this.acceptedTypes,
  });

  final int? max;
  final int? min;
  final int? maxItems;
  final int? minItems;
  final int? maxSize;
  final List<String>? acceptedTypes;

  factory FluffyValidation.fromJson(Map<String, dynamic> json) =>
      _$FluffyValidationFromJson(json);

  @override
  List<Object?> get props => [
    max,
    min,
    maxItems,
    minItems,
    maxSize,
    acceptedTypes,
  ];
}
