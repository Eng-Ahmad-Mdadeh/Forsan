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
  static const String order = '/requests';
  static String orderDetails(String id) => '$order/${Uri.encodeComponent(id)}';
  static String submitOrder(String orderId) => '$order/${Uri.encodeComponent(orderId)}/submit';
  static String orderSteps(String slug) => '/services/${Uri.encodeComponent(slug)}/form';
  //#endregion


  //#region document
  static const String document = '/documents';
  static String documentDetails(String orderId) => '$order/${Uri.encodeComponent(orderId)}/$document';
  //#endregion

  //#region files
  //static String uploadFile(String orderId) => '$order/${Uri.encodeComponent(orderId)}/files';
  static String uploadFile(String requestId, {String? itemId}) {
    final encodedRequestId = Uri.encodeComponent(requestId);
    if (itemId == null || itemId.isEmpty) {
      return '$order/$encodedRequestId/files';
    }

    return '$order/$encodedRequestId/required-documents/${Uri.encodeComponent(itemId)}';
  }

  static String deleteFile(String orderId,String fileId) => '$order/${Uri.encodeComponent(orderId)}/files/${Uri.encodeComponent(fileId)}';
  static String downloadFile(String fileId) => '$user/files/${Uri.encodeComponent(fileId)}';
  static String confirmFile(String orderId) => '$order/${Uri.encodeComponent(orderId)}/required-documents/submit';
  //#endregion

}
