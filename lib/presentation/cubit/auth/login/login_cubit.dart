import 'package:forsan/domain/entity/auth/auth_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(const LoginCubitState(user: null));

  void phoneChanged(String phone) => emit(
        state.copyWith(
          user: AuthEntity(
            phone: phone,
            code: null,
            fcm: null,
            typeMessage: null,
            rememberMe: null,
          ),
        ),
      );


}
