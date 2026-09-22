import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/core/utils/enums/enum_utils.dart';
import 'package:forsan/presentation/cubit/auth/complete_profile/complete_profile_cubit.dart';

void main() {
  group('CompleteProfileCubit', () {
    test('stores all entered profile values in AuthEntity', () {
      final cubit = CompleteProfileCubit();

      cubit.fullNameChanged('Ahmad Ali');
      cubit.emailChanged('ahmad@example.com');
      cubit.countryChanged(CountryCode.sy);
      cubit.nationalityChanged(CountryCode.sa);

      expect(cubit.state.user.fullName, 'Ahmad Ali');
      expect(cubit.state.user.email, 'ahmad@example.com');
      expect(cubit.state.user.country, CountryCode.sy);
      expect(cubit.state.user.nationality, CountryCode.sa);
      expect(cubit.state.hasRequiredSelections, isTrue);

      cubit.close();
    });

    test('does not discard values when another field changes', () {
      final cubit = CompleteProfileCubit();

      cubit.fullNameChanged('Ahmad Ali');
      cubit.countryChanged(CountryCode.sy);
      cubit.emailChanged('ahmad@example.com');

      expect(cubit.state.user.fullName, 'Ahmad Ali');
      expect(cubit.state.user.country, CountryCode.sy);
      expect(cubit.state.user.email, 'ahmad@example.com');

      cubit.close();
    });
  });
}
