import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:privateinsta/core/constants/endpoints.dart';
import 'package:privateinsta/core/utils/dio_clients.dart';
import 'package:privateinsta/core/utils/exception.dart';

class AuthenticationRepository {
  AuthenticationRepository();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrlEmulator,
      connectTimeout: const Duration(seconds: Endpoints.connectionTimeout),
      receiveTimeout: const Duration(seconds: Endpoints.receiveTimeout),
    ),
  );

  List<String> avaliableNames = <String>[];

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

  FutureOr<List<String>> checkUserName({
    required String userName,
  }) async {
    try {
      final String user = '${Endpoints.checkUsername}$userName';
      final BaseResponse<List<dynamic>> responseData =
          await DioClient(dioClient: _dio).get(user);
      avaliableNames.clear();
      if (responseData.status!) {
        avaliableNames = List<String>.from(responseData.data!);
      }
      return avaliableNames;
    } on DioException catch (e) {
      throw CustomException.fromDioException(e);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
