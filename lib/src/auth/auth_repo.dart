import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:privateinsta/core/constants/endpoints.dart';
import 'package:privateinsta/core/utils/dio_clients.dart';
import 'package:privateinsta/core/utils/exception.dart';

class AuthenticationRepository {
  AuthenticationRepository();

  final Dio _dio = Dio();

  FutureOr<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // final BaseRespose<SignInModel> a =
      //     await DioClient<SignInModel>().get(Endpoints.checkUsername);
      // print(a);
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<void> checkUserName({
    required String userName,
  }) async {
    try {
      final String user = '${Endpoints.checkUsername}$userName';
      final BaseResponse<List<String>> responseData =
          await DioClient(dioClient: _dio).get(user);
      print(responseData);
    } on DioException catch (e) {
      print(e.requestOptions.path);
      print(e.requestOptions.baseUrl);
      print(e.requestOptions.headers);
      print(e.requestOptions.uri);

      throw CustomException.fromDioException(e);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
