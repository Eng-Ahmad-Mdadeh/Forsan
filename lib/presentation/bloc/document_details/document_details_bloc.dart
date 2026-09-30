import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/document_details/document_details_model.dart';
import 'package:forsan/domain/entities/document/document_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'document_details_event.dart';
part 'document_details_state.dart';

class DocumentDetailsBloc
    extends Bloc<IDocumentDetailsEvent, IDocumentDetailsState> {
  DocumentDetailsBloc() : super(DocumentDetailsInitial()) {
    on<DocumentDetailsEvent>(_getDocumentDetails);
  }

  FutureOr<void> _getDocumentDetails(
    DocumentDetailsEvent event,
    Emitter<IDocumentDetailsState> emit,
  ) async {
    emit(DocumentDetailsLoading());
    try {
      final result =
          await locator<
            IUseCase<BaseModel<DocumentDetailsModel>?, DocumentEntity>
          >(instanceName: 'DocumentDetails')(event.entity);
      result.fold(
        (failure) => emit(DocumentDetailsFailed(failure.message)),
        (documentDetails) => emit(
          DocumentDetailsLoaded(documentDetailsModel: documentDetails),
        ),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(DocumentDetailsFailed(error.toString()));
    }
  }
}
