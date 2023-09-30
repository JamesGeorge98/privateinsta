// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter_login/Provider/baseprovider.dart';
// import 'package:flutter_login/models/dbmodels/accountdbmodel.dart';
// import 'package:flutter_login/services/network/constants/endpoints.dart';
// import 'package:flutter_login/services/network/exceptions/network_exception.dart';
// import 'package:flutter_login/utils/locator.dart';
// import 'package:http/http.dart' as http;

// abstract class RestInstance {
//   final RestClient _restClient = RestClient();
//   RestClient get restClient => _restClient;
//   AccountDBModel? currentUser = locator<BaseProvider>().currentUser;
// }

// abstract class BasicAuth {
//   AccountDBModel? currentuser = locator<BaseProvider>().currentUser;
// }

// class RestClient extends BasicAuth {
//   // GetComplex:----------------------------------------------------------------
//   Future<dynamic> restGetComplex(
//       String path, dynamic requestModel, Map<String, String> header) async {
//     var request = http.Request('GET', Uri.parse(path));
//     request.body = json.encode(requestModel);
//     Map<String, String> basicHeader = {
//       "Content-Type": "application/json",
//       'authorization':
//           'Basic ${base64.encode(utf8.encode('${currentuser?.userid}:${currentuser?.mobile}'))}'
//     };
//     basicHeader.addAll(header);
//     request.headers.addAll(basicHeader);

//     var streamedResponse = await request.send();
//     return await http.Response.fromStream(streamedResponse)
//         .timeout(const Duration(seconds: Endpoints.connectionTimeout))
//         .then(_createResponse);
//   }

//   // Get:-----------------------------------------------------------------------
//   Future<dynamic> restGet(String path, Map<String, String> header,
//       {String query = ""}) {
//     Map<String, String> basicHeader = {
//       "Content-Type": "application/json",
//       'authorization':
//           'Basic ${base64.encode(utf8.encode('${currentuser?.userid}:${currentuser?.mobile}'))}'
//     };

//     basicHeader.addAll(header);

//     return http
//         .get(Uri.parse("$path?$query"), headers: basicHeader)
//         .timeout(const Duration(seconds: Endpoints.connectionTimeout))
//         .then(_createResponse);
//   }

//   // Post:----------------------------------------------------------------------
//   Future<dynamic> restPost(String path,
//       {required Map<String, String> headers, body, encoding}) {
//     Map<String, String> basicHeader = {
//       "Content-Type": "application/json",
//       'authorization':
//           'Basic ${base64.encode(utf8.encode('${currentuser?.userid}:${currentuser?.mobile}'))}'
//     };
//     basicHeader.addAll(headers);

//     return http
//         .post(
//           Uri.parse(path),
//           body: body,
//           headers: basicHeader,
//         )
//         .then(_createResponse);
//   }

//   // Put:----------------------------------------------------------------------
//   Future<dynamic> restPut(String path,
//       {Map<String, String>? headers, body, encoding}) {
//     return http
//         .put(
//           Uri.https(Endpoints.baseUrl, path),
//           body: body,
//           headers: headers,
//           encoding: encoding,
//         )
//         .then(_createResponse);
//   }

//   // Delete:--------------------------------------------------------------------
//   Future<dynamic> restDelete(String path,
//       {Map<String, String>? headers, body, encoding}) {
//     return http
//         .delete(
//           Uri.https(Endpoints.baseUrl, path),
//           body: body,
//           headers: headers,
//           encoding: encoding,
//         )
//         .then(_createResponse);
//   }

//   // Response:------------------------------------------------------------------
//   dynamic _createResponse(http.Response response) {
//     print(response.statusCode);
//     switch (response.statusCode) {
//       case 200:
//         return json.decode(response.body);
//       case 400:
//         Map<String, dynamic> error = {
//           "status": false,
//           "msg": "Bad Request Error Contact Admin"
//         };
//         return error;
//       case 401:
//         Map<String, dynamic> error = {
//           "status": false,
//           "msg": "Unauthorized Error Contact Admin"
//         };
//         return error;
//       case 404:
//         Map<String, dynamic> error = {
//           "status": false,
//           "msg": "Page Not Found Contact Admin"
//         };
//         return error;
//       case 500:
//         Map<String, dynamic> error = {
//           "status": false,
//           "msg": "Internal Server Error Contact Admin"
//         };
//         return error;
//       default:
//         Map<String, dynamic> error = {
//           "status": false,
//           "msg": "something went worng"
//         };
//         return error;
//     }
//   }
// }
