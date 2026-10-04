import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/utils/enums/enum_utils.dart';
import 'package:forsan/domain/entities/auth/auth_entity.dart';
import 'package:forsan/presentation/cubit/edit_profile/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(const EditProfileState(user: AuthEntity()));

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
          fullName: fullName ?? user?.fullName,
          email: email ?? user?.email,
          country: country ?? user?.country,
          nationality: nationality ?? user?.nationality,

        ),
      ),
    );
  }
}
