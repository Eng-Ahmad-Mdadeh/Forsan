import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/service_type/service_type_model.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'service_type_event.dart';
part 'service_type_state.dart';

class ServiceTypeBloc extends Bloc<IServiceTypeEvent, IServiceTypeState> {
  ServiceTypeBloc() : super(ServiceTypeInitial()) {
    on<ServiceTypeEvent>(_getServiceTypes);
  }

  FutureOr<void> _getServiceTypes(
    ServiceTypeEvent event,
    Emitter<IServiceTypeState> emit,
  ) async {
    emit(ServiceTypeLoading());
    try {
      final result =
          await locator<IUseCase<BaseModel<ServiceTypeModel>?, Null>>(
            instanceName: 'ServiceType',
          )(null);
      result.fold(
        (failure) => emit(ServiceTypeFailed(failure.message)),
        (serviceTypes) => emit(
          ServiceTypeLoaded(serviceTypeModel: serviceTypes),
        ),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(ServiceTypeFailed(error.toString()));
    }
  }
}
