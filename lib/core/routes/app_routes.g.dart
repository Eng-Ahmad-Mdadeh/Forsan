// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $splashRoute,
  $loginRoute,
  $addPropertyRoute,
  $completeProfileRoute,
  $bankTransferRoute,
  $depositInvoiceRoute,
  $depositRoute,
  $withdrawBankTransferRoute,
  $withdrawDetailsRoute,
  $propertyDetailsRoute,
  $advertiserProfileRoute,
  $propertiesMapRoute,
  $walletRoute,
  $settingsRoute,
  $requestsRoute,
  $personalInformationRoute,
  $accountVerificationRoute,
  $notificationsRoute,
  $myReviewsRoute,
  $servicesRoute,
  $verifiedOfficesRoute,
  $walletTopUpRequestDetailsRoute,
  $walletTopUpRequestsRoute,
  $faqsRoute,
  $contactRoute,
  $privacyPolicyRoute,
  $termsAndConditionsRoute,
  $intellectualPropertyRightsRoute,
  $operationRoute,
  $appShellRoute,
];

RouteBase get $propertiesMapRoute => GoRouteData.$route(
  path: '/properties-map',
  factory: $PropertiesMapRoute._fromState,
);

mixin $PropertiesMapRoute on GoRouteData {
  static PropertiesMapRoute _fromState(GoRouterState state) =>
      const PropertiesMapRoute();

  @override
  String get location => GoRouteData.$location('/properties-map');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $contactRoute =>
    GoRouteData.$route(path: '/contact', factory: $ContactRoute._fromState);

mixin $ContactRoute on GoRouteData {
  static ContactRoute _fromState(GoRouterState state) => const ContactRoute();

  @override
  String get location => GoRouteData.$location('/contact');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $myReviewsRoute => GoRouteData.$route(
  path: '/my-reviews',
  factory: $MyReviewsRoute._fromState,
);

mixin $MyReviewsRoute on GoRouteData {
  static MyReviewsRoute _fromState(GoRouterState state) =>
      const MyReviewsRoute();

  @override
  String get location => GoRouteData.$location('/my-reviews');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $splashRoute =>
    GoRouteData.$route(path: '/', factory: $SplashRoute._fromState);

mixin $SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',
  factory: $LoginRoute._fromState,
  routes: [
    GoRouteData.$route(path: 'check_code', factory: $CheckCodeRoute._fromState),
  ],
);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CheckCodeRoute on GoRouteData {
  static CheckCodeRoute _fromState(GoRouterState state) =>
      const CheckCodeRoute();

  @override
  String get location => GoRouteData.$location('/login/check_code');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $addPropertyRoute => GoRouteData.$route(
  path: '/add-property',
  factory: $AddPropertyRoute._fromState,
);

mixin $AddPropertyRoute on GoRouteData {
  static AddPropertyRoute _fromState(GoRouterState state) =>
      const AddPropertyRoute();

  @override
  String get location => GoRouteData.$location('/add-property');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $completeProfileRoute => GoRouteData.$route(
  path: '/complete_profile',
  factory: $CompleteProfileRoute._fromState,
);

mixin $CompleteProfileRoute on GoRouteData {
  static CompleteProfileRoute _fromState(GoRouterState state) =>
      const CompleteProfileRoute();

  @override
  String get location => GoRouteData.$location('/complete_profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $bankTransferRoute => GoRouteData.$route(
  path: '/bank_transfer',
  factory: $BankTransferRoute._fromState,
);

mixin $BankTransferRoute on GoRouteData {
  static BankTransferRoute _fromState(GoRouterState state) =>
      const BankTransferRoute();

  @override
  String get location => GoRouteData.$location('/bank_transfer');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $depositInvoiceRoute => GoRouteData.$route(
  path: '/deposit_invoice',
  factory: $DepositInvoiceRoute._fromState,
);

mixin $DepositInvoiceRoute on GoRouteData {
  static DepositInvoiceRoute _fromState(GoRouterState state) =>
      DepositInvoiceRoute(
        paymentMethod: state.uri.queryParameters['payment-method'] ?? 'bank',
        $extra: state.extra as WalletTopUpEntity?,
      );

  DepositInvoiceRoute get _self => this as DepositInvoiceRoute;

  @override
  String get location => GoRouteData.$location(
    '/deposit_invoice',
    queryParams: {
      if (_self.paymentMethod != 'bank') 'payment-method': _self.paymentMethod,
    },
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $depositRoute =>
    GoRouteData.$route(path: '/deposit', factory: $DepositRoute._fromState);

mixin $DepositRoute on GoRouteData {
  static DepositRoute _fromState(GoRouterState state) => const DepositRoute();

  @override
  String get location => GoRouteData.$location('/deposit');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $withdrawBankTransferRoute => GoRouteData.$route(
  path: '/withdraw_bank_transfer',
  factory: $WithdrawBankTransferRoute._fromState,
);

mixin $WithdrawBankTransferRoute on GoRouteData {
  static WithdrawBankTransferRoute _fromState(GoRouterState state) =>
      const WithdrawBankTransferRoute();

  @override
  String get location => GoRouteData.$location('/withdraw_bank_transfer');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $withdrawDetailsRoute => GoRouteData.$route(
  path: '/withdraw_details',
  factory: $WithdrawDetailsRoute._fromState,
);

mixin $WithdrawDetailsRoute on GoRouteData {
  static WithdrawDetailsRoute _fromState(GoRouterState state) =>
      const WithdrawDetailsRoute();

  @override
  String get location => GoRouteData.$location('/withdraw_details');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $propertyDetailsRoute => GoRouteData.$route(
  path: '/property_details',
  factory: $PropertyDetailsRoute._fromState,
);

mixin $PropertyDetailsRoute on GoRouteData {
  static PropertyDetailsRoute _fromState(GoRouterState state) =>
      PropertyDetailsRoute(propertyId: state.uri.queryParameters['property-id']!);

  PropertyDetailsRoute get _self => this as PropertyDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/property_details',
    queryParams: {'property-id': _self.propertyId},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $advertiserProfileRoute => GoRouteData.$route(
  path: '/advertiser-profile',
  factory: $AdvertiserProfileRoute._fromState,
);

mixin $AdvertiserProfileRoute on GoRouteData {
  static AdvertiserProfileRoute _fromState(GoRouterState state) =>
      AdvertiserProfileRoute($extra: state.extra as PropertyModel);

  AdvertiserProfileRoute get _self => this as AdvertiserProfileRoute;

  @override
  String get location => GoRouteData.$location('/advertiser-profile');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

mixin $FavoritesRoute on GoRouteData {
  static FavoritesRoute _fromState(GoRouterState state) =>
      const FavoritesRoute();

  @override
  String get location => GoRouteData.$location('/favorites');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $walletRoute =>
    GoRouteData.$route(path: '/wallet', factory: $WalletRoute._fromState);

RouteBase get $settingsRoute =>
    GoRouteData.$route(path: '/settings', factory: $SettingsRoute._fromState);

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $requestsRoute =>
    GoRouteData.$route(path: '/requests', factory: $RequestsRoute._fromState);

mixin $RequestsRoute on GoRouteData {
  static RequestsRoute _fromState(GoRouterState state) =>
      const RequestsRoute();

  @override
  String get location => GoRouteData.$location('/requests');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $personalInformationRoute => GoRouteData.$route(
  path: '/personal_information',
  factory: $PersonalInformationRoute._fromState,
);

mixin $PersonalInformationRoute on GoRouteData {
  static PersonalInformationRoute _fromState(GoRouterState state) =>
      PersonalInformationRoute();

  @override
  String get location => GoRouteData.$location('/personal_information');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $accountVerificationRoute => GoRouteData.$route(
  path: '/account-verification',
  factory: $AccountVerificationRoute._fromState,
);

mixin $AccountVerificationRoute on GoRouteData {
  static AccountVerificationRoute _fromState(GoRouterState state) =>
      const AccountVerificationRoute();

  @override
  String get location => GoRouteData.$location('/account-verification');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $notificationsRoute => GoRouteData.$route(
  path: '/notifications',
  factory: $NotificationsRoute._fromState,
);

mixin $NotificationsRoute on GoRouteData {
  static NotificationsRoute _fromState(GoRouterState state) =>
      const NotificationsRoute();

  @override
  String get location => GoRouteData.$location('/notifications');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $servicesRoute => GoRouteData.$route(
  path: '/services',
  factory: $ServicesRoute._fromState,
);

mixin $ServicesRoute on GoRouteData {
  static ServicesRoute _fromState(GoRouterState state) => const ServicesRoute();

  @override
  String get location => GoRouteData.$location('/services');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $verifiedOfficesRoute => GoRouteData.$route(
  path: '/verified-offices',
  factory: $VerifiedOfficesRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'map',
      factory: $VerifiedOfficesMapRoute._fromState,
    ),
  ],
);

mixin $VerifiedOfficesRoute on GoRouteData {
  static VerifiedOfficesRoute _fromState(GoRouterState state) =>
      const VerifiedOfficesRoute();

  @override
  String get location => GoRouteData.$location('/verified-offices');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $VerifiedOfficesMapRoute on GoRouteData {
  static VerifiedOfficesMapRoute _fromState(GoRouterState state) =>
      const VerifiedOfficesMapRoute();

  @override
  String get location => GoRouteData.$location('/verified-offices/map');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $walletTopUpRequestDetailsRoute => GoRouteData.$route(
  path: '/wallet_top_up_request_details',
  factory: $WalletTopUpRequestDetailsRoute._fromState,
);

mixin $WalletTopUpRequestDetailsRoute on GoRouteData {
  static WalletTopUpRequestDetailsRoute _fromState(GoRouterState state) =>
      WalletTopUpRequestDetailsRoute($extra: state.extra as WalletTopUpModel);

  WalletTopUpRequestDetailsRoute get _self =>
      this as WalletTopUpRequestDetailsRoute;

  @override
  String get location =>
      GoRouteData.$location('/wallet_top_up_request_details');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $walletTopUpRequestsRoute => GoRouteData.$route(
  path: '/wallet_top_up_requests',
  factory: $WalletTopUpRequestsRoute._fromState,
);

mixin $WalletTopUpRequestsRoute on GoRouteData {
  static WalletTopUpRequestsRoute _fromState(GoRouterState state) =>
      const WalletTopUpRequestsRoute();

  @override
  String get location => GoRouteData.$location('/wallet_top_up_requests');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $faqsRoute =>
    GoRouteData.$route(path: '/faqs', factory: $FaqsRoute._fromState);

mixin $FaqsRoute on GoRouteData {
  static FaqsRoute _fromState(GoRouterState state) => const FaqsRoute();

  @override
  String get location => GoRouteData.$location('/faqs');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $privacyPolicyRoute => GoRouteData.$route(
  path: '/privacy_policy',
  factory: $PrivacyPolicyRoute._fromState,
);

mixin $PrivacyPolicyRoute on GoRouteData {
  static PrivacyPolicyRoute _fromState(GoRouterState state) =>
      const PrivacyPolicyRoute();

  @override
  String get location => GoRouteData.$location('/privacy_policy');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $termsAndConditionsRoute => GoRouteData.$route(
  path: '/terms_and_conditions',
  factory: $TermsAndConditionsRoute._fromState,
);

mixin $TermsAndConditionsRoute on GoRouteData {
  static TermsAndConditionsRoute _fromState(GoRouterState state) =>
      const TermsAndConditionsRoute();

  @override
  String get location => GoRouteData.$location('/terms_and_conditions');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $intellectualPropertyRightsRoute => GoRouteData.$route(
  path: '/intellectual_property_rights',
  factory: $IntellectualPropertyRightsRoute._fromState,
);

mixin $IntellectualPropertyRightsRoute on GoRouteData {
  static IntellectualPropertyRightsRoute _fromState(GoRouterState state) =>
      const IntellectualPropertyRightsRoute();

  @override
  String get location => GoRouteData.$location('/intellectual_property_rights');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $operationRoute => GoRouteData.$route(
  path: '/operation',
  factory: $OperationRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'details/:transactionId',
      factory: $OperationDetailsRoute._fromState,
    ),
  ],
);

RouteBase get $appShellRoute => StatefulShellRouteData.$route(
  factory: $AppShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/home', factory: $HomeRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/favorites',
          factory: $FavoritesRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/properties',
          factory: $PropertiesRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/more', factory: $MoreRoute._fromState),
      ],
    ),
  ],
);

extension $AppShellRouteExtension on AppShellRoute {
  static AppShellRoute _fromState(GoRouterState state) => AppShellRoute();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $WalletRoute on GoRouteData {
  static WalletRoute _fromState(GoRouterState state) => const WalletRoute();

  @override
  String get location => GoRouteData.$location('/wallet');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $OperationRoute on GoRouteData {
  static OperationRoute _fromState(GoRouterState state) =>
      const OperationRoute();

  @override
  String get location => GoRouteData.$location('/operation');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $OperationDetailsRoute on GoRouteData {
  static OperationDetailsRoute _fromState(GoRouterState state) =>
      OperationDetailsRoute(state.pathParameters['transactionId']!);

  OperationDetailsRoute get _self => this as OperationDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/operation/details/${Uri.encodeComponent(_self.transactionId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PropertiesRoute on GoRouteData {
  static PropertiesRoute _fromState(GoRouterState state) =>
      const PropertiesRoute();

  @override
  String get location => GoRouteData.$location('/properties');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MoreRoute on GoRouteData {
  static MoreRoute _fromState(GoRouterState state) => const MoreRoute();

  @override
  String get location => GoRouteData.$location('/more');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
