part of 'home_bloc.dart';

sealed class IHomeEvent extends Equatable {
  const IHomeEvent();
}

final class HomeEvent extends IHomeEvent {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}
