import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/core/constants/api_endpoints.dart';

void main() {
  group('ApiEndpoints.orderDetails', () {
    test('builds a relative request path with the ID as a path parameter', () {
      expect(
        ApiEndpoints.orderDetails('cmui81okw00237r4jkyujobta'),
        '/requests/cmui81okw00237r4jkyujobta',
      );
    });

    test('encodes identifiers before placing them in the URL path', () {
      expect(ApiEndpoints.orderDetails('FR 2026/1'), '/requests/FR%202026%2F1');
    });
  });
}
