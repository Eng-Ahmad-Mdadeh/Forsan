import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/core/utils/pagination/page_pagination_controller.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/document_list/document_list_model.dart';
import 'package:forsan/domain/entities/document/document_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'document_list_event.dart';
part 'document_list_state.dart';

class DocumentListBloc extends Bloc<IDocumentListEvent, IDocumentListState> {
  DocumentListBloc({
    IUseCase<BaseModel<DocumentListModel>?, DocumentEntity>? getDocumentList,
  }) : _getDocumentList =
           getDocumentList ??
           locator<IUseCase<BaseModel<DocumentListModel>?, DocumentEntity>>(
             instanceName: 'DocumentList',
           ),
       super(const DocumentListInitial()) {
    on<GetDocumentListEvent>(_getDocuments);
    on<LoadMoreDocumentListEvent>(_loadMore);
  }

  final IUseCase<BaseModel<DocumentListModel>?, DocumentEntity>
      _getDocumentList;

  final PagePaginationController<Item, String> paginationController =
      PagePaginationController<Item, String>(identifier: (item) => item.id);
  int _requestVersion = 0;

  bool get canLoadMore => paginationController.hasMore;

  bool get isLoadingMore => paginationController.isLoadingMore;

  FutureOr<void> _getDocuments(
    GetDocumentListEvent event,
    Emitter<IDocumentListState> emit,
  ) async {
    final requestVersion = ++_requestVersion;
    emit(const DocumentListLoading());
    paginationController.reset();

    try {
      final result = await _getDocumentList(event.entity.copyWith(page: 1));
      if (requestVersion != _requestVersion) return;

      result.fold(
        (failure) => emit(DocumentListFailed(failure.message)),
        (response) {
          final model = response?.data;
          _replacePage(model);
          emit(DocumentListLoaded(documentList: _withAccumulatedItems(model)));
        },
      );
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      if (requestVersion != _requestVersion) return;
      emit(DocumentListFailed(error.toString()));
    }
  }

  FutureOr<void> _loadMore(
    LoadMoreDocumentListEvent event,
    Emitter<IDocumentListState> emit,
  ) async {
    final currentState = state;
    if (currentState is! DocumentListLoaded ||
        paginationController.isLoadingMore ||
        !paginationController.hasMore) {
      return;
    }

    paginationController.setLoadingMore(true);
    final requestVersion = _requestVersion;

    try {
      final result = await _getDocumentList(
        event.entity.copyWith(page: paginationController.nextPage),
      );
      if (requestVersion != _requestVersion) return;

      result.fold(
        (failure) => log(failure.message),
        (response) {
          final model = response?.data;
          _appendPage(model);
          emit(
            DocumentListLoaded(
              documentList: _withAccumulatedItems(
                model ?? currentState.documentList,
              ),
            ),
          );
        },
      );
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      if (requestVersion != _requestVersion) return;
    } finally {
      paginationController.setLoadingMore(false);
    }
  }

  void _replacePage(DocumentListModel? model) {
    paginationController.replaceWith(
      items: model?.items,
      page: model?.page,
      pageSize: model?.pageSize,
      total: model?.total,
    );
  }

  void _appendPage(DocumentListModel? model) {
    paginationController.append(
      items: model?.items,
      page: model?.page,
      pageSize: model?.pageSize,
      total: model?.total,
    );
  }

  DocumentListModel? _withAccumulatedItems(DocumentListModel? model) {
    if (model == null) return null;

    return DocumentListModel(
      items: paginationController.items,
      page: model.page,
      pageSize: model.pageSize,
      total: model.total,
    );
  }
}
