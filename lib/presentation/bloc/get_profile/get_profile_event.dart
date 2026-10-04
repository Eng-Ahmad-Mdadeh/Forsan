part of 'get_profile_bloc.dart';

sealed class IGetProfileEvent extends Equatable{
  const IGetProfileEvent();
}
final class GetProfileEvent extends IGetProfileEvent {
  const GetProfileEvent();


  @override
  List<Object?> get props => [];
}