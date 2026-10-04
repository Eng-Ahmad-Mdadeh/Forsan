part of 'get_profile_bloc.dart';


sealed class IGetProfileState extends Equatable{
  const IGetProfileState();
}

final class GetProfileInitial extends IGetProfileState {
  @override

  List<Object?> get props => [];
}
final class GetProfileLoaded extends IGetProfileState {

  final BaseModel<ProfileModel>? profileModel;
  const GetProfileLoaded({required this.profileModel});

  @override

  List<Object?> get props => [profileModel];
}
final class GetProfileLoading extends IGetProfileState {
  @override

  List<Object?> get props => [];
}
final class GetProfileFailed extends IGetProfileState {
  const GetProfileFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}