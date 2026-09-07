import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_theme.dart';
import 'core/routes/app_routes.dart';

void main() => runApp(const ForsanApp());

class ForsanApp extends StatelessWidget {
  const ForsanApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_, _) => MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'فُرسان',
      theme: AppTheme.lightTheme('ar'),
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const SizedBox.shrink(),
      ),
      routerConfig: appRouter,
    ),
  );
}
