import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/data/models/auth/auth_model.dart';
import 'package:forsan/data/models/base/base_model.dart';

void main() {
  AuthModel parseAuth(Object? json) =>
      AuthModel.fromJson(json as Map<String, dynamic>);

  group('BaseModel.fromJsonWithRootData', () {
    test('parses an access token returned at the response root', () {
      final response = BaseModel<AuthModel>.fromJsonWithRootData(
        {
          'success': true,
          'accessToken': 'otp-access-token',
          'accessTokenExpiresIn': 3600,
          'refreshToken': 'otp-refresh-token',
        },
        parseAuth,
      );

      expect(response.data?.accessToken, 'otp-access-token');
      expect(response.data?.accessTokenExpiresIn, 3600);
      expect(response.data?.refreshToken, 'otp-refresh-token');
    });

    test('keeps parsing a nested data payload when it is present', () {
      final response = BaseModel<AuthModel>.fromJsonWithRootData(
        {
          'success': true,
          'data': {
            'accessToken': 'nested-access-token',
          },
        },
        parseAuth,
      );

      expect(response.data?.accessToken, 'nested-access-token');
    });
  });
}
