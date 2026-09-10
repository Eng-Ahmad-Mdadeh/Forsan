import 'package:equatable/equatable.dart';

class NewOrderState extends Equatable {
  const NewOrderState({
    this.establishmentType = 'one_person',
    this.applicantType = 'syrian_citizen',
  });

  final String establishmentType;
  final String applicantType;

  NewOrderState copyWith({
    String? establishmentType,
    String? applicantType,
  }) {
    return NewOrderState(
      establishmentType: establishmentType ?? this.establishmentType,
      applicantType: applicantType ?? this.applicantType,
    );
  }

  @override
  List<Object?> get props => [establishmentType, applicantType];
}
