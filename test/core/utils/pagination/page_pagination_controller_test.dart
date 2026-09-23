import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/core/utils/pagination/page_pagination_controller.dart';

void main() {
  group('PagePaginationController', () {
    test('starts with empty pagination state', () {
      final controller = PagePaginationController<int, int>();

      expect(controller.items, isEmpty);
      expect(controller.currentPage, 0);
      expect(controller.pageSize, 0);
      expect(controller.total, 0);
      expect(controller.nextPage, 1);
      expect(controller.hasMore, isFalse);
      expect(controller.isEmpty, isTrue);
    });

    test('replaces items and pagination metadata', () {
      final controller = PagePaginationController<int, int>();

      controller.replaceWith(
        items: [1, 2],
        page: 1,
        pageSize: 2,
        total: 4,
      );

      expect(controller.items, [1, 2]);
      expect(controller.currentPage, 1);
      expect(controller.pageSize, 2);
      expect(controller.total, 4);
      expect(controller.nextPage, 2);
      expect(controller.hasMore, isTrue);
      expect(controller.isEmpty, isFalse);
    });

    test('appends items without duplicating known identifiers', () {
      final controller = PagePaginationController<_Item, int>(
        identifier: (item) => item.id,
      );

      controller.replaceWith(
        items: const [_Item(1), _Item(2)],
        page: 1,
        pageSize: 2,
        total: 3,
      );
      controller.append(
        items: const [_Item(2), _Item(3)],
        page: 2,
        pageSize: 2,
        total: 3,
      );

      expect(controller.items, const [_Item(1), _Item(2), _Item(3)]);
      expect(controller.currentPage, 2);
      expect(controller.hasMore, isFalse);
    });

    test('reset clears items and pagination metadata', () {
      final controller = PagePaginationController<int, int>()
        ..replaceWith(
          items: [1],
          page: 1,
          pageSize: 20,
          total: 1,
        )
        ..reset();

      expect(controller.items, isEmpty);
      expect(controller.currentPage, 0);
      expect(controller.pageSize, 0);
      expect(controller.total, 0);
      expect(controller.nextPage, 1);
    });
  });
}

class _Item {
  const _Item(this.id);

  final int id;

  @override
  bool operator ==(Object other) => other is _Item && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
