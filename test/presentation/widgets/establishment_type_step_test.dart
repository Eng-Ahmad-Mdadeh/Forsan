import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/core/l10n/app_localizations.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/establishment_type_step.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_option_card.dart';

void main() {
  testWidgets('reflects the first-step value restored from a draft', (
    tester,
  ) async {
    final selectedValues = ValueNotifier<Map<String, dynamic>>(const {});
    final step = StepModel.fromJson({
      'title': 'Establishment',
      'number': 1,
      'sections': [
        {
          'id': 'establishment-type',
          'title': 'Establishment type',
          'description': 'Choose a type',
          'fields': [
            {
              'id': 'establishmentType',
              'type': 'select',
              'label': 'Type',
              'required': true,
              'options': [
                {
                  'label': 'Single shareholder',
                  'value': 'single_shareholder',
                  'description': 'One owner',
                },
              ],
            },
          ],
        },
      ],
    });

    await tester.pumpWidget(
      _TestApp(
        child: ValueListenableBuilder<Map<String, dynamic>>(
          valueListenable: selectedValues,
          builder: (_, values, _) => EstablishmentTypeStep(
            formKey: GlobalKey<FormState>(),
            step: step,
            selectedValues: values,
            onFieldChanged: (_, _) {},
          ),
        ),
      ),
    );

    expect(_optionCard(tester).selected, isFalse);

    selectedValues.value = const {
      'establishmentType': 'single_shareholder',
    };
    await tester.pump();

    expect(_optionCard(tester).selected, isTrue);
  });
}

OrderOptionCard _optionCard(WidgetTester tester) => tester.widget(
  find.widgetWithText(OrderOptionCard, 'Single shareholder'),
);

class _TestApp extends StatelessWidget {
  const _TestApp({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, _) => MaterialApp(
        locale: const Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Scaffold(body: child),
      ),
    );
  }
}
