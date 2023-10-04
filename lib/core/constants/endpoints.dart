abstract class Endpoints {

  // base url
  static const String baseUrl =
      'http://192.168.1.104:3000/api/v1/';

  static const String getFCM = 'https://fcm.googleapis.com/fcm/send';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30;

  // booking endpoints

  // Authentication ================================================

  static const String signIn = '${baseUrl}auth/signin';
  static const String checkUsername = '${baseUrl}auth/';

}
