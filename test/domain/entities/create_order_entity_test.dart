import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';

void main() {
  group('CreateOrderEntity request bodies', () {
    test('creation contains only the selected service slug', () {
      const entity = CreateOrderEntity(
        serviceSlug: 'business-formation',
        formValues: {'establishmentType': 'single_shareholder'},
        currentStep: 1,
      );

      expect(entity.toCreateJson(), {'serviceSlug': 'business-formation'});
    });

    test('step update contains merged answers and one-based next step', () {
      const entity = CreateOrderEntity(
        formValues: {'establishmentType': 'single_shareholder'},
        currentStep: 1,
      );

      expect(entity.toUpdateJson(), {
        'formData': {'establishmentType': 'single_shareholder'},
        'currentStep': 2,
      });
    });

    test('submission contains the agreement values', () {
      const entity = CreateOrderEntity(
        acknowledgesAccuracy: true,
        acceptsTerms: true,
      );

      expect(entity.toSubmitJson(), {
        'agreements': {
          'acknowledgesAccuracy': true,
          'acceptsTerms': true,
        },
      });
    });
  });
}
