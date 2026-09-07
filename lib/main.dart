import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_theme.dart';
import 'core/l10n/app_localizations.dart';
import 'core/resources/app_colors.dart';
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
      theme: AppTheme.lightTheme('ar'),
      darkTheme: AppTheme.darkTheme('ar'),
      themeMode: ThemeMode.light,
      //locale: 'ar',
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: appRouter,
      builder: (context, child) {
        return ColoredBox(
          color: AppColors.backGround,
          child: SafeArea(top: false, child: child ?? const SizedBox.shrink()),
        );
      },
    ),
  );
}
