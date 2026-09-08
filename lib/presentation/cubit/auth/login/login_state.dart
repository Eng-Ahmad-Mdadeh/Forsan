part of 'login_cubit.dart';

class LoginCubitState extends Equatable {
  final AuthEntity? user;

  const LoginCubitState({
    required this.user,
  });

  LoginCubitState copyWith({
    AuthEntity? user,
  }) {
    return LoginCubitState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        user,
      ];
}
