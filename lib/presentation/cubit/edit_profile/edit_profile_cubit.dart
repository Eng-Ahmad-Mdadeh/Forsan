import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/presentation/cubit/edit_profile/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(const EditProfileState());

  void selectCountry(String? country) {
    if (country == null || country == state.country) return;
    emit(state.copyWith(country: country));
  }

  void selectNationality(String? nationality) {
    if (nationality == null || nationality == state.nationality) return;
    emit(state.copyWith(nationality: nationality));
  }
}
