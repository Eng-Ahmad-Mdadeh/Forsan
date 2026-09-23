import 'package:forsan/core/utils/pagination/page_pagination_controller.dart';
import 'package:forsan/data/models/pagination/page_pagination_model.dart';

/// Exposes reusable page-pagination operations to a BLoC without adding
/// pagination-only fields to its UI states.
mixin BasePaginationBloc<T, K> {
  PagePaginationController<T, K> get paginationController;

  bool get canLoadMore => paginationController.hasMore;

  bool get isLoadingMore => paginationController.isLoadingMore;

  int get currentPage => paginationController.currentPage;

  int get nextPage => paginationController.nextPage;

  List<T> get items => paginationController.items;

  void resetPagination() => paginationController.reset();

  void replacePage(PagePaginationModel<T>? page) {
    paginationController.replaceWith(
      items: page?.items,
      page: page?.page,
      pageSize: page?.pageSize,
      total: page?.total,
    );
  }

  void appendPage(PagePaginationModel<T>? page) {
    paginationController.append(
      items: page?.items,
      page: page?.page,
      pageSize: page?.pageSize,
      total: page?.total,
    );
  }

  void setLoadingMore(bool value) {
    paginationController.setLoadingMore(value);
  }
}
