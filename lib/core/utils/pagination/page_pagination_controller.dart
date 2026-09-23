/// A reusable controller that manages page-based pagination for any type [T].
///
/// The controller keeps the accumulated items and the latest pagination
/// metadata received from the backend. When an [identifier] is provided,
/// duplicate items are not appended to the collection.
class PagePaginationController<T, K> {
  PagePaginationController({
    K? Function(T value)? identifier,
  }) : _identifier = identifier;

  final K? Function(T value)? _identifier;
  final List<T> _items = <T>[];

  int _currentPage = 0;
  int _pageSize = 0;
  int _total = 0;
  bool _isLoadingMore = false;

  /// An unmodifiable view of the accumulated items.
  List<T> get items => List.unmodifiable(_items);

  /// The latest page received from the backend.
  int get currentPage => _currentPage;

  /// The page size reported by the backend.
  int get pageSize => _pageSize;

  /// The total number of items available on the backend.
  int get total => _total;

  /// The page that should be requested next.
  int get nextPage => _currentPage + 1;

  /// Whether there are more items that can be requested.
  bool get hasMore => _items.length < _total;

  /// Whether a request for the next page is currently in progress.
  bool get isLoadingMore => _isLoadingMore;

  /// Whether the controller currently holds no items.
  bool get isEmpty => _items.isEmpty;

  /// Clears the stored items and pagination metadata.
  void reset() {
    _items.clear();
    _currentPage = 0;
    _pageSize = 0;
    _total = 0;
    _isLoadingMore = false;
  }

  /// Updates the loading state for the next page request.
  void setLoadingMore(bool value) => _isLoadingMore = value;

  /// Replaces the current items and updates the pagination metadata.
  void replaceWith({
    required List<T>? items,
    required int? page,
    required int? pageSize,
    required int? total,
  }) {
    _merge(
      items: items,
      page: page,
      pageSize: pageSize,
      total: total,
      append: false,
    );
  }

  /// Appends new items and updates the pagination metadata.
  void append({
    required List<T>? items,
    required int? page,
    required int? pageSize,
    required int? total,
  }) {
    _merge(
      items: items,
      page: page,
      pageSize: pageSize,
      total: total,
      append: true,
    );
  }

  void _merge({
    required List<T>? items,
    required int? page,
    required int? pageSize,
    required int? total,
    required bool append,
  }) {
    _currentPage = page ?? _currentPage;
    _pageSize = pageSize ?? _pageSize;
    _total = total ?? _total;

    if (!append) {
      _items.clear();
    }

    if (items == null || items.isEmpty) return;

    if (!append || _identifier == null) {
      _items.addAll(items);
      return;
    }

    final Set<K> existingKeys = _items.map(_identifier).whereType<K>().toSet();

    for (final T item in items) {
      final K? key = _identifier(item);
      if (key == null || existingKeys.add(key)) {
        _items.add(item);
      }
    }
  }
}
