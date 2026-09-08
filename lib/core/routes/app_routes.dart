import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tamalok/core/extension/localization_extension.dart';
import 'package:tamalok/core/extension/page_builder_extension.dart';
import 'package:tamalok/core/routes/app_shell.dart';
import 'package:tamalok/core/services/locator/locator.dart';
import 'package:tamalok/core/utils/enums/enum_utils.dart';
import 'package:tamalok/data/data_sources/auth/auth_storage_data_source.dart';
import 'package:tamalok/presentation/screens/add_property/add_property_screen.dart';
import 'package:tamalok/presentation/screens/account_verification/account_verification_screen.dart';
import 'package:tamalok/presentation/screens/advertiser_profile/advertiser_profile_screen.dart';
import 'package:tamalok/data/model/property/property_model.dart';
import 'package:tamalok/presentation/screens/check_code/check_code_screen.dart';
import 'package:tamalok/presentation/screens/complete_profile/complete_profile_screen.dart';
import 'package:tamalok/presentation/screens/customer_service/customer_service_screen.dart';
import 'package:tamalok/presentation/screens/faqs/faqs_screen.dart';
import 'package:tamalok/presentation/screens/home/home_screen.dart';
import 'package:tamalok/presentation/screens/home/map_screen.dart';
import 'package:tamalok/presentation/screens/favorites/favorites_screen.dart';
import 'package:tamalok/presentation/screens/login/login_screen.dart';
import 'package:tamalok/presentation/screens/legal/legal_document_screen.dart';
import 'package:tamalok/presentation/screens/more/more_screen.dart';
import 'package:tamalok/presentation/screens/my_reviews/my_reviews_screen.dart';
import 'package:tamalok/data/model/wallet_top_up/wallet_top_up_model.dart';
import 'package:tamalok/domain/entity/wallet_top_up/wallet_top_up_entity.dart';
import 'package:tamalok/presentation/screens/wallet/wallet_top_up_requests/wallet_top_up_request_details_screen.dart';
import 'package:tamalok/presentation/screens/wallet/wallet_top_up_requests/wallet_top_up_requests_screen.dart';
import 'package:tamalok/presentation/screens/notifications/notifications_screen.dart';
import 'package:tamalok/presentation/screens/operation_details/operation_details_screen.dart';
import 'package:tamalok/presentation/screens/operation/operation_screen.dart';
import 'package:tamalok/presentation/screens/personal_information/personal_information_screen.dart';
import 'package:tamalok/presentation/screens/properties/properties_screen.dart';
import 'package:tamalok/presentation/screens/requests/requests_screen.dart';
import 'package:tamalok/presentation/screens/settings/settings_screen.dart';
import 'package:tamalok/presentation/screens/services/services_screen.dart';
import 'package:tamalok/presentation/screens/verified_offices/verified_offices_screen.dart';
import 'package:tamalok/presentation/screens/verified_offices/verified_offices_map_screen.dart';
import 'package:tamalok/presentation/screens/property_details/property_details_screen.dart';
import 'package:tamalok/presentation/screens/splash/splash_screen.dart';
import 'package:tamalok/presentation/screens/wallet/bank_transfer/bank_transfer_screen.dart';
import 'package:tamalok/presentation/screens/wallet/deposit_invoice/deposit_invoice_screen.dart';
import 'package:tamalok/presentation/screens/wallet/deposit/deposit_screen.dart';
import 'package:tamalok/presentation/screens/wallet/wallet_screen.dart';
import 'package:tamalok/presentation/screens/wallet/withdraw_bank_transfer/withdraw_bank_transfer_screen.dart';
import 'package:tamalok/presentation/screens/wallet/withdraw_details/withdraw_details_screen.dart';

part 'app_routes.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>(debugLabel: 'root-scaffold-messenger');

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  initialLocation: const SplashRoute().location,
  routes: $appRoutes,
  redirect: _authGuard,
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
    const CheckCodeRoute().location,
  };

  if (token == null && !publicLocations.contains(state.matchedLocation)) {
    // return LoginRoute(redirect: state.uri.toString()).location;
    return LoginRoute().location;
  }
  return null;
}

@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const SplashScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
  routes: [
    TypedGoRoute<CheckCodeRoute>(path: 'check-code'),
  ],
)
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const LoginScreen().buildPage(pageAnimation: PageAnimation.fade);
  }

}

class CheckCodeRoute extends GoRouteData with $CheckCodeRoute {
  const CheckCodeRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const CheckCodeScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}

@TypedGoRoute<AddPropertyRoute>(path: '/add-property')
class AddPropertyRoute extends GoRouteData with $AddPropertyRoute {
  const AddPropertyRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const AddPropertyScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<CompleteProfileRoute>(path: '/complete-profile')
class CompleteProfileRoute extends GoRouteData with $CompleteProfileRoute {
  const CompleteProfileRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const CompleteProfileScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<BankTransferRoute>(path: '/bank-transfer')
class BankTransferRoute extends GoRouteData with $BankTransferRoute {
  const BankTransferRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const BankTransferScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<DepositInvoiceRoute>(path: '/deposit-invoice')
class DepositInvoiceRoute extends GoRouteData with $DepositInvoiceRoute {
  const DepositInvoiceRoute({this.paymentMethod = 'bank', this.$extra});

  final String paymentMethod;
  final WalletTopUpEntity? $extra;

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return DepositInvoiceScreen(
      paymentMethod: paymentMethod,
      walletTopUp: $extra,
    ).buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<DepositRoute>(path: '/deposit')
class DepositRoute extends GoRouteData with $DepositRoute {
  const DepositRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const DepositScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<WithdrawBankTransferRoute>(path: '/withdraw-bank-transfer')
class WithdrawBankTransferRoute extends GoRouteData with $WithdrawBankTransferRoute {
  const WithdrawBankTransferRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const WithdrawBankTransferScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<WithdrawDetailsRoute>(path: '/withdraw-details')
class WithdrawDetailsRoute extends GoRouteData with $WithdrawDetailsRoute {
  const WithdrawDetailsRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const WithdrawDetailsScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<PropertyDetailsRoute>(path: '/property-details/:propertyId')
class PropertyDetailsRoute extends GoRouteData with $PropertyDetailsRoute {
  const PropertyDetailsRoute({required this.propertyId});

  final String propertyId;

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return PropertyDetailsScreen(
      propertyId: propertyId,
    ).buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<AdvertiserProfileRoute>(path: '/advertiser-profile')
class AdvertiserProfileRoute extends GoRouteData with $AdvertiserProfileRoute {
  const AdvertiserProfileRoute({required this.$extra});

  final PropertyModel $extra;

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return AdvertiserProfileScreen(property: $extra).buildPage(pageAnimation: PageAnimation.slide);
  }
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const HomeScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}

@TypedGoRoute<PropertiesMapRoute>(path: '/properties-map')
class PropertiesMapRoute extends GoRouteData with $PropertiesMapRoute {
  const PropertiesMapRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const MapScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

class FavoritesRoute extends GoRouteData with $FavoritesRoute {
  const FavoritesRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const FavoritesScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<SettingsRoute>(path: '/settings')
class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const SettingsScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<RequestsRoute>(path: '/requests')
class RequestsRoute extends GoRouteData with $RequestsRoute {
  const RequestsRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const RequestsScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<PersonalInformationRoute>(path: '/personal-information')
class PersonalInformationRoute extends GoRouteData with $PersonalInformationRoute {
  const PersonalInformationRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const PersonalInformationScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<AccountVerificationRoute>(path: '/account-verification')
class AccountVerificationRoute extends GoRouteData with $AccountVerificationRoute {
  const AccountVerificationRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const AccountVerificationScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<NotificationsRoute>(path: '/notifications')
class NotificationsRoute extends GoRouteData with $NotificationsRoute {
  const NotificationsRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const NotificationsScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<MyReviewsRoute>(path: '/my-reviews')
class MyReviewsRoute extends GoRouteData with $MyReviewsRoute {
  const MyReviewsRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const MyReviewsScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<ServicesRoute>(path: '/services')
class ServicesRoute extends GoRouteData with $ServicesRoute {
  const ServicesRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const ServicesScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<VerifiedOfficesRoute>(
  path: '/verified-offices',
  routes: [TypedGoRoute<VerifiedOfficesMapRoute>(path: 'map')],
)
class VerifiedOfficesRoute extends GoRouteData with $VerifiedOfficesRoute {
  const VerifiedOfficesRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return const VerifiedOfficesScreen().buildPage(
      pageAnimation: PageAnimation.slide,
    );
  }
}

class VerifiedOfficesMapRoute extends GoRouteData with $VerifiedOfficesMapRoute {
  const VerifiedOfficesMapRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const VerifiedOfficesMapScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<WalletTopUpRequestDetailsRoute>(path: '/wallet-top-up-request-details')
class WalletTopUpRequestDetailsRoute extends GoRouteData with $WalletTopUpRequestDetailsRoute {
  const WalletTopUpRequestDetailsRoute({required this.$extra});

  final WalletTopUpModel $extra;

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return WalletTopUpRequestDetailsScreen(request: $extra).buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<WalletTopUpRequestsRoute>(path: '/wallet-top-up-requests')
class WalletTopUpRequestsRoute extends GoRouteData with $WalletTopUpRequestsRoute {
  const WalletTopUpRequestsRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const WalletTopUpRequestsScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<FaqsRoute>(path: '/faqs')
class FaqsRoute extends GoRouteData with $FaqsRoute {
  const FaqsRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const FaqsScreen().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<ContactRoute>(path: '/contact')
class ContactRoute extends GoRouteData with $ContactRoute {
  const ContactRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomerServiceScreen(
      title: context.loc.contact_us,
      description: context.loc.more_desc_contact_us,
    ).buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<PrivacyPolicyRoute>(path: '/privacy-policy')
class PrivacyPolicyRoute extends GoRouteData with $PrivacyPolicyRoute {
  const PrivacyPolicyRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const LegalDocumentScreen.privacy().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<TermsAndConditionsRoute>(path: '/terms-and-conditions')
class TermsAndConditionsRoute extends GoRouteData with $TermsAndConditionsRoute {
  const TermsAndConditionsRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const LegalDocumentScreen.terms().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedGoRoute<IntellectualPropertyRightsRoute>(path: '/intellectual-property-rights')
class IntellectualPropertyRightsRoute extends GoRouteData with $IntellectualPropertyRightsRoute {
  const IntellectualPropertyRightsRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const LegalDocumentScreen.intellectualPropertyRights().buildPage(pageAnimation: PageAnimation.slide);
  }
}

@TypedStatefulShellRoute<AppShellRoute>(
  branches: [
    TypedStatefulShellBranch<HomeBranch>(
      routes: [TypedGoRoute<HomeRoute>(path: '/home', routes: [])],
    ),
    TypedStatefulShellBranch<FavoritesBranch>(
      routes: [TypedGoRoute<FavoritesRoute>(path: '/favorites', routes: [])],
    ),
    TypedStatefulShellBranch<PropertiesBranch>(
      routes: [TypedGoRoute<PropertiesRoute>(path: '/properties', routes: [])],
    ),
    TypedStatefulShellBranch<MoreBranch>(
      routes: [TypedGoRoute<MoreRoute>(path: '/more', routes: [])],
    ),
  ],
)
class AppShellRoute extends StatefulShellRouteData {
  const AppShellRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
    return AppShell(navigationShell: navigationShell);
  }
}

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();
}

class FavoritesBranch extends StatefulShellBranchData {
  const FavoritesBranch();
}

class PropertiesBranch extends StatefulShellBranchData {
  const PropertiesBranch();
}

class MoreBranch extends StatefulShellBranchData {
  const MoreBranch();
}

@TypedGoRoute<WalletRoute>(path: '/wallet')
class WalletRoute extends GoRouteData with $WalletRoute {
  const WalletRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const WalletScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}

@TypedGoRoute<OperationRoute>(
  path: '/operation',
  routes: [TypedGoRoute<OperationDetailsRoute>(path: 'details/:transactionId')],
)
class OperationRoute extends GoRouteData with $OperationRoute {
  const OperationRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const OperationScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}

class OperationDetailsRoute extends GoRouteData with $OperationDetailsRoute {
  const OperationDetailsRoute(this.transactionId);

  final String transactionId;

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return OperationDetailsScreen(transactionId: transactionId).buildPage(pageAnimation: PageAnimation.slide);
  }
}

class PropertiesRoute extends GoRouteData with $PropertiesRoute {
  const PropertiesRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const PropertiesScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}

class MoreRoute extends GoRouteData with $MoreRoute {
  const MoreRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) {
    return const MoreScreen().buildPage(pageAnimation: PageAnimation.fade);
  }
}
