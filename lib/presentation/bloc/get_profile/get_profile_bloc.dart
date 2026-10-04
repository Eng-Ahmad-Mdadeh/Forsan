import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/services/locator/locator.dart';
import '../../../data/models/base/base_model.dart';
import '../../../data/models/profile/profile_model.dart';
import '../../../domain/usecases/i_use_case.dart';

part 'get_profile_event.dart';
part 'get_profile_state.dart';

class GetProfileBloc extends Bloc<GetProfileEvent, IGetProfileState> {
  GetProfileBloc() : super(GetProfileInitial()) {
    on<GetProfileEvent>(_getProfile);
  }
  FutureOr<void> _getProfile(
      GetProfileEvent event,
      Emitter<IGetProfileState> emit,
      ) async {
    emit(GetProfileLoading());
    try {
      final result =
      await locator<IUseCase<BaseModel<ProfileModel>?, Null>>(
        instanceName: 'GetProfile',
      )(null);
      result.fold(
            (failure) => emit(GetProfileFailed(failure.message)),
            (profile) => emit(GetProfileLoaded(profileModel: profile)),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(GetProfileFailed(error.toString()));
    }
  }
}
