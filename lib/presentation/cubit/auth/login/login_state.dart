part of 'login_cubit.dart';

class LoginCubitState extends Equatable {
  final AuthEntity? user;
  final String messageType;

  const LoginCubitState({
    required this.user,
    required this.messageType,
  });

  LoginCubitState copyWith({
    AuthEntity? user,
    String? messageType,
  }) {
    return LoginCubitState(
      user: user ?? this.user,
      messageType: messageType ?? this.messageType,
    );
  }

  @override
  List<Object?> get props => [
        user,
        messageType,
      ];
}
