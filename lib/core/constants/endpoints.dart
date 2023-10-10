abstract class Endpoints {
  // base url
  static const String baseUrl = 'http://localhost:3000/api/v1/';

  static const String getFCM = 'https://fcm.googleapis.com/fcm/send';

  static const String baseUrlEmulator = 'http://10.0.2.2:3000/api/v1/';
  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30;

  // booking endpoints

  // Authentication ================================================

  static const String signIn = '${baseUrl}auth/signin';
  static const String checkUsername = '${baseUrl}auth/';
}
