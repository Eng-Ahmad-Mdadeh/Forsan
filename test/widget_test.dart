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
      find.bySemanticsLabel('الصورة الرئيسية'),
      findsOneWidget,
    );
    expect(find.text('الخدمات السريعة'), findsNothing);
    expect(find.textContaining('FR-2026-001259'), findsOneWidget);
    expect(find.text('استكمال المتطلبات'), findsOneWidget);
    expect(find.bySemanticsLabel('شعار فرسان'), findsOneWidget);
    expect(find.text('الطلبات النشطة'), findsOneWidget);
    expect(find.text('إجراءات مطلوبة'), findsOneWidget);
    expect(find.text('إجمالي المدفوع'), findsOneWidget);
    expect(find.text('المبالغ المستحقة'), findsOneWidget);
    expect(find.text('01'), findsNWidgets(2));
    expect(find.text('2,522 ر.س'), findsNWidgets(2));
    await tester.scrollUntilVisible(find.text('تأسيس شركة لشخص واحد'), 200);
    expect(find.text('بانتظار المستندات'), findsOneWidget);
    expect(find.text('تأسيس شركة لشخص واحد'), findsOneWidget);
    expect(find.text('FR-2026-00125925'), findsOneWidget);
    expect(find.text('20/05/2026'), findsOneWidget);
    expect(find.text('المستشار: أحمد إبراهيم'), findsOneWidget);
    expect(find.text('50%'), findsOneWidget);
    expect(find.text('نسبة الإنجاز'), findsOneWidget);
    expect(find.text('تفاصيل الطلب'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('إجراءات سريعة'), 200);
    expect(find.text('إجراءات سريعة'), findsOneWidget);
    expect(find.text('طلب جديد'), findsOneWidget);
    expect(find.text('الدعم'), findsOneWidget);
    expect(find.bySemanticsLabel('إنشاء طلب جديد'), findsOneWidget);
    expect(find.bySemanticsLabel('التواصل مع الدعم'), findsOneWidget);

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
