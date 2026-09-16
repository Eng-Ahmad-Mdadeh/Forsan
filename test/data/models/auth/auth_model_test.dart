import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/data/models/auth/auth_model.dart';

void main() {
  group('AuthModel.fromJson', () {
    test('parses the send OTP response', () {
      final model = AuthModel.fromJson({
        'challengeId': 'cmu3zi4n9000f7rrlsfoweym1',
        'expiresIn': 300,
        'devCode': '123456',
      });

      expect(model.challengeId, 'cmu3zi4n9000f7rrlsfoweym1');
      expect(model.expiresIn, 300);
      expect(model.devCode, '123456');
      expect(model.accessToken, isNull);
      expect(model.user, isNull);
    });

    test('parses the verify OTP response', () {
      final model = AuthModel.fromJson({
        'accessToken': 'access-token',
        'user': {
          'id': 'cmu2ng7bv00017rseir2gekki',
          'phone': '+963944123456',
          'fullName': 'سامر العلي',
          'role': 'USER',
        },
      });

      expect(model.accessToken, 'access-token');
      expect(model.user?.id, 'cmu2ng7bv00017rseir2gekki');
      expect(model.user?.phone, '+963944123456');
      expect(model.user?.fullName, 'سامر العلي');
      expect(model.user?.role, 'USER');
      expect(model.challengeId, isNull);
    });
  });
}
