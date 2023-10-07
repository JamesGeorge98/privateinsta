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
      await Future<void>.delayed(const Duration(seconds: 2));
      final BaseResponse<List<String>> responseData =
          await DioClient(dioClient: _dio).get(user);
    } on DioException catch (e) {
      CustomException.fromDioException(e);
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
