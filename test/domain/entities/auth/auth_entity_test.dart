import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/domain/entities/auth/auth_entity.dart';

void main() {
  test('includes the challenge ID in the verification request', () {
    const entity = AuthEntity(
      phone: '+963900000000',
      code: '123456',
      challengeId: 'login-challenge',
    );

    expect(entity.toJson(), {
      'phone': '+963900000000',
      'code': '123456',
      'challengeId': 'login-challenge',
    });
  });

  test('includes the selected message type in the login request', () {
    const entity = AuthEntity(
      phone: '+963900000000',
      typeMessage: 'whatsapp',
    );

    expect(entity.toJson(), {
      'phone': '+963900000000',
      'type_message': 'whatsapp',
    });
  });
}
