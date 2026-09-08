import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forsan/core/constants/app_theme.dart';
import 'package:forsan/core/helper/local_storage_helper.dart';
import 'package:forsan/core/l10n/app_localizations.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/core/services/app_lifecycle_tracker.dart';
import 'package:forsan/core/services/app_services.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/core/utils/connection_network_service.dart';
import 'package:forsan/presentation/cubit/code_check/code_check_cubit.dart';

import 'presentation/cubit/language/language_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await AppServices.init();

  ConnectionService().initialize(rootNavigatorKey);
  AppLifecycleTracker.instance.start();

  final initialLocale = await _loadInitialLocale();
  final languageCubit = LanguageCubit(initialLocale: initialLocale);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: languageCubit),
        BlocProvider<CodeCheckCubit>(create: (_) => CodeCheckCubit()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  static const _designSize = Size(428, 926);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: _designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return BlocBuilder<LanguageCubit, Locale>(
          builder: (context, locale) {
            return MaterialApp.router(
              scaffoldMessengerKey: rootScaffoldMessengerKey,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme(locale.languageCode),
              darkTheme: AppTheme.darkTheme(locale.languageCode),
              themeMode: ThemeMode.light,
              locale: locale,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              routerConfig: appRouter,
              builder: (context, child) {
                return ColoredBox(
                  color: AppColors.backGround,
                  child: SafeArea(
                    top: false,
                    child: child ?? const SizedBox.shrink(),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

Future<Locale> _loadInitialLocale() async {
  const fallback = Locale('ar');
  final response = await locator<LocalStorageHelper>().getValue(
    LanguageCubit.boxName,
    LanguageCubit.localeKey,
  );

  return response.fold((_) => fallback, (value) {
    final languageCode = value?.toString();
    if (languageCode != null &&
        LanguageCubit.supportedLocales.contains(languageCode)) {
      return Locale(languageCode);
    }
    return fallback;
  });
}
