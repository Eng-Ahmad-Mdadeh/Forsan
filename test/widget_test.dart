import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/main.dart';

void main() {
  testWidgets('AppShell navigates between the four main pages', (tester) async {
    await tester.pumpWidget(const ForsanApp());
    await tester.pump();

    expect(find.bySemanticsLabel('شعار فرسان للخدمات'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('مرحباً سيد محمد'), findsOneWidget);
    expect(find.text('كيف يمكننا مساعدتك اليوم ؟'), findsOneWidget);
    expect(find.bySemanticsLabel('الملف الشخصي'), findsOneWidget);
    expect(find.bySemanticsLabel('الإشعارات'), findsOneWidget);
    expect(find.text('الرئيسية'), findsOneWidget);
    expect(
      find.bySemanticsLabel('كل خدماتك ومتابعاتك في مكان واحد'),
      findsOneWidget,
    );
    expect(find.text('الخدمات السريعة'), findsNothing);

    await tester.tap(find.text('طلباتي'));
    await tester.pumpAndSettle();
    expect(find.text('لا توجد طلبات بعد'), findsOneWidget);

    await tester.tap(find.text('المستندات'));
    await tester.pumpAndSettle();
    expect(find.text('مستنداتك بأمان'), findsOneWidget);

    await tester.tap(find.text('المزيد'));
    await tester.pumpAndSettle();
    expect(find.text('الملف الشخصي'), findsOneWidget);
  });
}
