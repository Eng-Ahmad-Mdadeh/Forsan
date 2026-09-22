part of 'complete_profile_bloc.dart';

sealed class ICompleteProfileEvent extends Equatable {
  const ICompleteProfileEvent();
}

final class CompleteProfileEvent extends ICompleteProfileEvent {
  const CompleteProfileEvent(this.entity);

  final AuthEntity entity;

  @override
  List<Object?> get props => [entity];
}
