import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/core/extension/validation_extension.dart';

void main() {
  group('isValidPhone', () {
    test('accepts Syrian mobile phone formats', () {
      expect('953302487'.isValidPhone, isTrue);
      expect('0953302487'.isValidPhone, isTrue);
      expect('+963953302487'.isValidPhone, isTrue);
      expect('00963953302487'.isValidPhone, isTrue);
    });

    test('continues to accept Saudi mobile phone formats', () {
      expect('512345678'.isValidPhone, isTrue);
      expect('0512345678'.isValidPhone, isTrue);
      expect('+966512345678'.isValidPhone, isTrue);
      expect('00966512345678'.isValidPhone, isTrue);
    });

    test('rejects invalid phone numbers', () {
      expect('123456789'.isValidPhone, isFalse);
      expect('0912345678'.isValidPhone, isFalse);
      expect('95330248'.isValidPhone, isFalse);
      expect('+9639533024870'.isValidPhone, isFalse);
    });
  });
}
