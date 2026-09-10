import 'package:equatable/equatable.dart';

class NewOrderState extends Equatable {
  const NewOrderState({
    this.currentStep = 0,
    this.establishmentType = 'one_person',
    this.applicantType = 'syrian_citizen',
  });

  final int currentStep;
  final String establishmentType;
  final String applicantType;

  NewOrderState copyWith({
    int? currentStep,
    String? establishmentType,
    String? applicantType,
  }) {
    return NewOrderState(
      currentStep: currentStep ?? this.currentStep,
      establishmentType: establishmentType ?? this.establishmentType,
      applicantType: applicantType ?? this.applicantType,
    );
  }

  @override
  List<Object?> get props => [currentStep, establishmentType, applicantType];
}
