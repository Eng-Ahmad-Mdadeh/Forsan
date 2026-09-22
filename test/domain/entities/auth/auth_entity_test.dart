import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/core/utils/enums/enum_utils.dart';
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

  test('serializes country and nationality using their API codes', () {
    const entity = AuthEntity(
      country: CountryCode.sy,
      nationality: CountryCode.sa,
    );

    expect(entity.toJson(), {
      'country': 'SY',
      'nationality': 'SA',
    });
  });

  test('provides localized country names independently from API codes', () {
    expect(CountryCode.sy.displayName(isArabic: true), 'سوريا');
    expect(CountryCode.sy.displayName(isArabic: false), 'Syria');
    expect(CountryCode.sy.apiValue, 'SY');
  });
}
