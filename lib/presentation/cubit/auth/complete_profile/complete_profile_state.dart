part of 'complete_profile_cubit.dart';

class CompleteProfileState extends Equatable {
  const CompleteProfileState({required this.user});

  final AuthEntity user;

  bool get hasRequiredSelections =>
      user.country != null && user.nationality != null;

  CompleteProfileState copyWith({AuthEntity? user}) {
    return CompleteProfileState(user: user ?? this.user);
  }

  @override
  List<Object?> get props => [user];
}
