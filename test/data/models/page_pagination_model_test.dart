import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/data/models/pagination/page_pagination_model.dart';

void main() {
  group('PagePaginationModel', () {
    test('parses items and page metadata from JSON', () {
      final model = PagePaginationModel<_Item>.fromJson(
        {
          'items': [
            {'id': 'first'},
            {'id': 'second'},
          ],
          'page': 2,
          'pageSize': 20,
          'total': 35,
        },
        (json) => _Item.fromJson(json as Map<String, dynamic>),
      );

      expect(model.items, const [_Item('first'), _Item('second')]);
      expect(model.page, 2);
      expect(model.pageSize, 20);
      expect(model.total, 35);
    });

    test('supports nullable response values', () {
      final model = PagePaginationModel<_Item>.fromJson(
        const {
          'items': null,
          'page': null,
          'pageSize': null,
          'total': null,
        },
        (json) => _Item.fromJson(json as Map<String, dynamic>),
      );

      expect(model.items, isNull);
      expect(model.page, isNull);
      expect(model.pageSize, isNull);
      expect(model.total, isNull);
    });
  });
}

class _Item {
  const _Item(this.id);

  factory _Item.fromJson(Map<String, dynamic> json) {
    return _Item(json['id'] as String);
  }

  final String id;

  @override
  bool operator ==(Object other) => other is _Item && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
