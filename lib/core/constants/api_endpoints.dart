class ApiEndpoints {
  const ApiEndpoints._();

  //#region Base Url
  static const String baseUrl = 'https://api.forsan.sy/api';
  static const String user = '/mobile';
  static const String mediaUrl = 'http://backend-dev.tamleek.maktab.sa/media/';

  //#endregion

  //#region Auth
  static const String auth = '/auth';
  static const String login = '/login';
  static const String checkCode = '/check-code';


  //#region Email
  static const String email = '/email';
  static const String sendOtp = '/otp/request';
  static const String verifyOtp = '/otp/verify';

  //#endregion

  //#endregion

  //#region Profile
  static const String upDateProfile = '/me';
  static const String banners = '/banners';
  static const String properties = '/properties';
  static const String bankAccounts = '/platform-bank-accounts';
  static const String walletTopUpRequests = '/wallet-top-up-requests';
  static const String walletTransactions = '/wallet-transactions';
  static const String archive = '/archive';
  static const String getMeta = '/meta';
  static const String cms = '/cms';
  static const String content = '/content';
  static const String privacyPolicies = '/privacy-policies';
  static const String termsAndConditions = '/terms-and-conditions';
  static const String intellectualPropertyRights = '/intellectual-property-rights';
  static const String successPartners = '/success-partners';
  static const String notifications = '/notifications';
  static const String markAsRead = '/mark-as-read';


  //#endregion

  //#region Media
  static const String media = '/media';
  static const String upload = '/upload';
  static const String remove = '/remove';
  //#endregion
}
