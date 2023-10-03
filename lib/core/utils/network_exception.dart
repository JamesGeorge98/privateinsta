class NetworkException implements Exception {

  NetworkException({this.message, this.statusCode});
  String? message;
  int? statusCode;
}


