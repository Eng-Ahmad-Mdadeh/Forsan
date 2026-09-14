import 'package:equatable/equatable.dart';

class EditProfileState extends Equatable {
  const EditProfileState({
    this.country,
    this.nationality,
  });

  final String? country;
  final String? nationality;

  bool get hasRequiredSelections => country != null && nationality != null;

  EditProfileState copyWith({
    String? country,
    String? nationality,
  }) {
    return EditProfileState(
      country: country ?? this.country,
      nationality: nationality ?? this.nationality,
    );
  }

  @override
  List<Object?> get props => [country, nationality];
}
