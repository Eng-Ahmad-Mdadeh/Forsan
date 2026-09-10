import 'package:equatable/equatable.dart';

class NewOrderState extends Equatable {
  const NewOrderState({
    this.currentStep = 0,
    this.establishmentType = 'one_person',
  });

  final int currentStep;
  final String establishmentType;

  NewOrderState copyWith({
    int? currentStep,
    String? establishmentType,
  }) {
    return NewOrderState(
      currentStep: currentStep ?? this.currentStep,
      establishmentType: establishmentType ?? this.establishmentType,
    );
  }

  @override
  List<Object?> get props => [currentStep, establishmentType];
}
