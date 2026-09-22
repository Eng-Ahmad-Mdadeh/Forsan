import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/home/home_model.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<IHomeEvent, IHomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>(_getHome);
  }

  FutureOr<void> _getHome(
    HomeEvent event,
    Emitter<IHomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final result = await locator<IUseCase<BaseModel<HomeModel>?, Null>>(
        instanceName: 'Home',
      )(null);
      result.fold(
        (failure) => emit(HomeFailed(failure.message)),
        (home) => emit(HomeLoaded(homeModel: home)),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(HomeFailed(error.toString()));
    }
  }
}
