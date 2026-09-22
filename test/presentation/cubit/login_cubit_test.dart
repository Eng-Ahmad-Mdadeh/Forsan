import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/presentation/cubit/auth/login/login_cubit.dart';

void main() {
  group('LoginCubit', () {
    test('uses sms as the default message type', () {
      final cubit = LoginCubit();

      expect(cubit.state.messageType, 'sms');

      cubit.close();
    });

    test('changes the message type without losing the phone number', () {
      final cubit = LoginCubit();

      cubit.phoneChanged('0999123456');
      cubit.messageTypeChanged('whatsapp');

      expect(cubit.state.user?.phone, '0999123456');
      expect(cubit.state.messageType, 'whatsapp');

      cubit.close();
    });
  });
}
