import 'package:flutter/widgets.dart';

/// Connects a scrollable widget to either page- or cursor-based pagination.
mixin PaginationScrollMixin<T extends StatefulWidget> on State<T> {
  late final ScrollController paginationScrollController;

  bool _isPaginationInProgress = false;

  double get paginationThreshold => 200;

  bool get canLoadMore;

  bool get isLoadingMore;

  void onLoadMore();

  @override
  void initState() {
    super.initState();
    paginationScrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    paginationScrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!paginationScrollController.hasClients ||
        _isPaginationInProgress ||
        isLoadingMore ||
        !canLoadMore) {
      return;
    }

    final position = paginationScrollController.position;
    if (position.extentAfter > paginationThreshold) return;

    _isPaginationInProgress = true;
    onLoadMore();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isPaginationInProgress = false;
    });
  }
}
