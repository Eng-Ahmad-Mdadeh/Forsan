import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/legal_page/legal_page_model.dart';
import 'package:forsan/domain/entities/legal_page/legal_page_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'legal_page_event.dart';
part 'legal_page_state.dart';

class LegalPageBloc extends Bloc<ILegalPageEvent, ILegalPageState> {
  LegalPageBloc() : super(LegalPageInitial()) {
    on<LegalPageEvent>(_getLegalPage);
  }

  FutureOr<void> _getLegalPage(
    LegalPageEvent event,
    Emitter<ILegalPageState> emit,
  ) async {
    emit(LegalPageLoading());
    try {
      final result =
          await locator<IUseCase<BaseModel<LegalPageModel>?, LegalPageEntity>>(
            instanceName: 'LegalPage',
          )(event.entity);
      result.fold(
        (failure) => emit(LegalPageFailed(failure.message)),
        (legalPage) => emit(LegalPageLoaded(legalPageModel: legalPage)),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(LegalPageFailed(error.toString()));
    }
  }
}
