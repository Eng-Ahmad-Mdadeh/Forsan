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
  DocumentDetailsBloc({
    IUseCase<BaseModel<DocumentDetailsModel>?, DocumentEntity>?
    getDocumentDetails,
  }) : _getDocumentDetails =
           getDocumentDetails ??
           locator<
             IUseCase<BaseModel<DocumentDetailsModel>?, DocumentEntity>
           >(instanceName: 'DocumentDetails'),
       super(const DocumentDetailsInitial()) {
    on<DocumentDetailsEvent>(_onGetDocumentDetails);
  }

  final IUseCase<BaseModel<DocumentDetailsModel>?, DocumentEntity>
  _getDocumentDetails;

  FutureOr<void> _onGetDocumentDetails(
    DocumentDetailsEvent event,
    Emitter<IDocumentDetailsState> emit,
  ) async {
    emit(const DocumentDetailsLoading());

    try {
      final result = await _getDocumentDetails(event.entity);
      result.fold(
        (failure) => emit(DocumentDetailsFailed(failure.message)),
        (response) => emit(DocumentDetailsLoaded(documentDetails: response)),
      );
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      emit(DocumentDetailsFailed(error.toString()));
    }
  }
}
