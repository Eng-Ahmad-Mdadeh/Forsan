import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forsan/core/extension/page_builder_extension.dart';
import 'package:forsan/core/routes/app_shell.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/core/utils/enums/enum_utils.dart';
import 'package:forsan/data/data_sources/auth/auth_storage_data_source.dart';
import 'package:forsan/presentation/screens/check_code/check_code_screen.dart';
import 'package:forsan/presentation/screens/documents/documents_screen.dart';
import 'package:forsan/presentation/screens/home/home_screen.dart';
import 'package:forsan/presentation/screens/login/login_screen.dart';
import 'package:forsan/presentation/screens/more/more_screen.dart';
import 'package:forsan/presentation/screens/orders/orders_screen.dart';
import 'package:forsan/presentation/screens/order_details/orders_details_screen.dart';
import 'package:forsan/presentation/screens/orders/models/order_item.dart';
import 'package:forsan/presentation/screens/signup/signup_screen.dart';
import 'package:forsan/presentation/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/complete_requirements/complete_requirements_screen.dart';

part 'app_routes.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>(
  debugLabel: 'root-scaffold-messenger',
);

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  initialLocation: const SplashRoute().location,
  routes: $appRoutes,
  //redirect: _authGuard,
);

Future<String?> _authGuard(BuildContext context, GoRouterState state) async {
  final tokenResult = await locator<AuthStorageDataSource>().getToken();
  final token = tokenResult.fold<String?>((failure) {
    log('Error retrieving token: $failure');
    return null;
  }, (value) => value);

  final publicLocations = <String>{
    const SplashRoute().location,
    const LoginRoute().location,
    const SignupRoute().location,
    const CheckCodeRoute().location,
  };

  if (token == null && !publicLocations.contains(state.matchedLocation)) {
    return const LoginRoute().location;
  }
  return null;
}

@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return SplashScreen(
      onFinished: () => const HomeRoute().go(context),
    ).buildPage(pageAnimation: PageAnimation.fade);
  }
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
  routes: [TypedGoRoute<CheckCodeRoute>(path: 'check-code')],
)
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return const LoginScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}

class CheckCodeRoute extends GoRouteData with $CheckCodeRoute {
  const CheckCodeRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return const CheckCodeScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}

@TypedGoRoute<SignupRoute>(path: '/signup')
class SignupRoute extends GoRouteData with $SignupRoute {
  const SignupRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return const SignupScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}

@TypedGoRoute<OrdersDetailsRoute>(
  path: '/order-details',
  routes: [
    TypedGoRoute<CompleteRequirementsRoute>(path: 'complete-requirements'),
  ],
)
class OrdersDetailsRoute extends GoRouteData with $OrdersDetailsRoute {
  const OrdersDetailsRoute(this.$extra);

  final OrderItem $extra;

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return OrdersDetailsScreen(
      order: $extra,
    ).buildPage(pageAnimation: PageAnimation.fade);
  }
}

class CompleteRequirementsRoute extends GoRouteData
    with $CompleteRequirementsRoute {
  const CompleteRequirementsRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return const CompleteRequirementsScreen().buildPage(
      pageAnimation: PageAnimation.fade,
    );
  }
}

@TypedStatefulShellRoute<AppShellRoute>(
  branches: [
    TypedStatefulShellBranch<HomeBranch>(
      routes: [TypedGoRoute<HomeRoute>(path: '/home')],
    ),
    TypedStatefulShellBranch<OrdersBranch>(
      routes: [TypedGoRoute<OrdersRoute>(path: '/orders')],
    ),
    TypedStatefulShellBranch<DocumentsBranch>(
      routes: [TypedGoRoute<DocumentsRoute>(path: '/documents')],
    ),
    TypedStatefulShellBranch<MoreBranch>(
      routes: [TypedGoRoute<MoreRoute>(path: '/more')],
    ),
  ],
)
class AppShellRoute extends StatefulShellRouteData {
  const AppShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AppShell(navigationShell: navigationShell);
  }
}

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();
}

class OrdersBranch extends StatefulShellBranchData {
  const OrdersBranch();
}

class DocumentsBranch extends StatefulShellBranchData {
  const DocumentsBranch();
}

class MoreBranch extends StatefulShellBranchData {
  const MoreBranch();
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return const HomeScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}

class OrdersRoute extends GoRouteData with $OrdersRoute {
  const OrdersRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return const OrdersScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}

class DocumentsRoute extends GoRouteData with $DocumentsRoute {
  const DocumentsRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return const DocumentsScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}

class MoreRoute extends GoRouteData with $MoreRoute {
  const MoreRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return const MoreScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}
