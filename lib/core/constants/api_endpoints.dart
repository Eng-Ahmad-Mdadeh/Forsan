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
  //#endregion

  //#region Email
  static const String email = '/email';
  static const String sendOtp = '/otp/request';
  static const String verifyOtp = '/otp/verify';
  //#endregion


  //#region Profile
  static const String upDateProfile = '/me';
  //#endregion


  //#region Home
  static const String home = '/home';
  //#endregion

  //#region order
  static const String serviceType = '/services/categories';
  static const String orderList = '/requests';
  static String orderDetails(String id) => '$orderList/${Uri.encodeComponent(id)}';
  //#endregion


  //#region Media
  static const String media = '/media';
  static const String upload = '/upload';
  static const String remove = '/remove';
  //#endregion
}
