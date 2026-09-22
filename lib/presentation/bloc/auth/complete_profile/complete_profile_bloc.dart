import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/profile/profile_model.dart';
import 'package:forsan/domain/entities/auth/auth_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'complete_profile_event.dart';
part 'complete_profile_state.dart';

class CompleteProfileBloc
    extends Bloc<ICompleteProfileEvent, ICompleteProfileState> {
  CompleteProfileBloc() : super(CompleteProfileInitial()) {
    on<CompleteProfileEvent>(_completeProfile);
  }

  FutureOr<void> _completeProfile(
    CompleteProfileEvent event,
    Emitter<ICompleteProfileState> emit,
  ) async {
    emit(CompleteProfileLoading());
    try {
      final result =
          await locator<IUseCase<BaseModel<ProfileModel>?, AuthEntity>>(
            instanceName: 'Profile',
          )(event.entity);
      result.fold(
        (failure) => emit(CompleteProfileFailed(failure.message)),
        (profile) => emit(CompleteProfileLoaded(profileModel: profile)),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(CompleteProfileFailed(error.toString()));
    }
  }
}
