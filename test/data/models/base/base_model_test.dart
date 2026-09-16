import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/data/models/auth/auth_model.dart';
import 'package:forsan/data/models/base/base_model.dart';

void main() {
  AuthModel parseAuth(Object? json) =>
      AuthModel.fromJson(json as Map<String, dynamic>);

  group('BaseModel.fromJsonWithRootData', () {
    test('parses auth data returned at the response root', () {
      final response = BaseModel<AuthModel>.fromJsonWithRootData(
        {
          'success': true,
          'message': 'OTP sent',
          'challengeId': 'root-challenge',
          'expiresIn': 120,
        },
        parseAuth,
      );

      expect(response.success, isTrue);
      expect(response.data?.challengeId, 'root-challenge');
      expect(response.data?.expiresIn, 120);
    });

    test('keeps parsing a nested data payload when it is present', () {
      final response = BaseModel<AuthModel>.fromJsonWithRootData(
        {
          'success': true,
          'data': {
            'challengeId': 'nested-challenge',
            'expiresIn': 60,
          },
        },
        parseAuth,
      );

      expect(response.data?.challengeId, 'nested-challenge');
      expect(response.data?.expiresIn, 60);
    });
  });
}
