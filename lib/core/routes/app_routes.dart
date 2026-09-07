import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_shell.dart';
import '../../presentation/screens/documents/documents_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/more/more_screen.dart';
import '../../presentation/screens/orders/orders_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

abstract final class AppRoutes {
  static const splash = '/';
  static const home = '/home';
  static const orders = '/orders';
  static const documents = '/documents';
  static const more = '/more';
}

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, _) => SplashScreen(
        onFinished: () => context.go(AppRoutes.home),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: AppRoutes.home, builder: (_, _) => const HomeScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: AppRoutes.orders, builder: (_, _) => const OrdersScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.documents,
              builder: (_, _) => const DocumentsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: AppRoutes.more, builder: (_, _) => const MoreScreen()),
          ],
        ),
      ],
    ),
  ],
);
