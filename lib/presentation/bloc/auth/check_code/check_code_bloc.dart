import 'dart:async';
import 'dart:developer';

import 'package:forsan/domain/entities/auth/auth_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/auth/auth_model.dart';
import 'package:forsan/data/models/base/base_model.dart';

part 'check_code_event.dart';

part 'check_code_state.dart';

class CheckCodeBloc extends Bloc<ICheckCodeEvent, ICheckCodeState> {
  CheckCodeBloc() : super(CheckCodeInitial()) {
    on<CheckCodeEvent>(_checkCode);
    on<ResendCodeEvent>(_resendCode);
  }

  FutureOr<void> _checkCode(CheckCodeEvent event, emit) async {
    emit(CheckCodeLoading());
    try {
      final result = await locator<IUseCase<BaseModel<AuthModel>?, AuthEntity>>(instanceName: 'CheckCode')(
        event.entity,
      );
      result.fold((l) => emit(CheckCodeFailed(l.message)), (r) => emit(CheckCodeLoaded(authModel: r)));
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      emit(CheckCodeFailed(e.toString()));
    }
  }

  FutureOr<void> _resendCode(ResendCodeEvent event, emit) async {
    emit(CheckCodeLoading());
    try {
      final result = await locator<IUseCase<BaseModel<AuthModel>?, AuthEntity>>(instanceName: 'ResendCode')(
        event.entity,
      );
      result.fold((l) => emit(CheckCodeFailed(l.message)), (r) => emit(const ResendCodeSuccess()));
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      emit(CheckCodeFailed(e.toString()));
    }
  }
}
