import 'package:equatable/equatable.dart';

import '../../../domain/entities/auth/auth_entity.dart';

class EditProfileState extends Equatable {
  const EditProfileState({
    this.user,
  });
  final AuthEntity? user;

  //bool get hasRequiredSelections => user.country != null && user.nationality != null;

  EditProfileState copyWith({
    AuthEntity? user,

  }) {
    return EditProfileState(
      user: user ?? this.user,

    );
  }

  @override
  List<Object?> get props => [user];
}
