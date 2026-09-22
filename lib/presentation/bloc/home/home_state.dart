part of 'home_bloc.dart';

sealed class IHomeState extends Equatable {
  const IHomeState();
}

final class HomeInitial extends IHomeState {
  @override
  List<Object?> get props => [];
}

final class HomeLoading extends IHomeState {
  @override
  List<Object?> get props => [];
}

final class HomeLoaded extends IHomeState {
  const HomeLoaded({required this.homeModel});

  final BaseModel<HomeModel>? homeModel;

  @override
  List<Object?> get props => [homeModel];
}

final class HomeFailed extends IHomeState {
  const HomeFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
