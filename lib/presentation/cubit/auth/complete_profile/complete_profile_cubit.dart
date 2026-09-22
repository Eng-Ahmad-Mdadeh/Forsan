import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/utils/enums/enum_utils.dart';
import 'package:forsan/domain/entities/auth/auth_entity.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit()
    : super(const CompleteProfileState(user: AuthEntity()));

  void fullNameChanged(String fullName) {
    _emitUser(fullName: fullName);
  }

  void emailChanged(String email) {
    _emitUser(email: email);
  }

  void countryChanged(CountryCode? country) {
    if (country == null) return;
    _emitUser(country: country);
  }

  void nationalityChanged(CountryCode? nationality) {
    if (nationality == null) return;
    _emitUser(nationality: nationality);
  }

  void _emitUser({
    String? fullName,
    String? email,
    CountryCode? country,
    CountryCode? nationality,
  }) {
    final user = state.user;
    emit(
      state.copyWith(
        user: AuthEntity(
          phone: user.phone,
          fullName: fullName ?? user.fullName,
          email: email ?? user.email,
          country: country ?? user.country,
          nationality: nationality ?? user.nationality,
          typeMessage: user.typeMessage,
          code: user.code,
          challengeId: user.challengeId,
          fcm: user.fcm,
          rememberMe: user.rememberMe,
        ),
      ),
    );
  }
}
