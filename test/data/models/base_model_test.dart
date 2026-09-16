import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/data/models/auth/auth_model.dart';
import 'package:forsan/data/models/base/base_model.dart';

void main() {
  test('fromDataJson wraps a direct API payload as data', () {
    final model = BaseModel<AuthModel>.fromDataJson(
      const {
        'challengeId': 'challenge-123',
        'expiresIn': 300,
        'devCode': '123456',
      },
      (json) => AuthModel.fromJson(json as Map<String, dynamic>),
    );

    expect(model.data?.challengeId, 'challenge-123');
    expect(model.data?.expiresIn, 300);
  });
}
