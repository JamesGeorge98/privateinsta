import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:privateinsta/core/constants/endpoints.dart';

// ignore: constant_identifier_names
typedef JSON = Map<String, dynamic>;

class BaseResponse<T> {
  BaseResponse({this.status, this.data, this.message, this.error});
  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse<T>(
      status: json['status'] as bool? ?? false,
      data: json['data'] as T?,
      message: json['message'] as String? ?? '',
      error: json['error'] as String? ?? '',
    );
  }

  bool? status;
  T? data;
  String? message;
  String? error;
}

class DioClient {
  DioClient({
    required Dio dioClient,
    Iterable<Interceptor>? interceptors,
    HttpClientAdapter? httpClientAdapter,
    BaseOptions? baseOptions,
  }) : _dio = dioClient {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
    if (httpClientAdapter != null) {
      _dio.httpClientAdapter = httpClientAdapter;
    }
    if (baseOptions != null) {
      _dio.options = baseOptions;
    } else {
      _dio.options = BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: const Duration(seconds: Endpoints.connectionTimeout),
        receiveTimeout: const Duration(seconds: Endpoints.receiveTimeout),
      );
    }
  }

  final Dio _dio;

  // Get:-----------------------------------------------------------------------
  Future<BaseResponse<R>> get<R>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<JSON> response = await _dio.get<JSON>(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return BaseResponse<R>.fromJson(response.data!);
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<BaseResponse<R>> post<R>(
    String uri, {
    JSON? data,
    JSON? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<JSON> response = await _dio.post<JSON>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return BaseResponse<R>.fromJson(response.data!);
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<BaseResponse<R>> put<R>(
    String uri, {
    JSON? data,
    JSON? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<JSON> response = await _dio.put<JSON>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return BaseResponse<R>.fromJson(response.data!);
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<BaseResponse<R>> delete<R>(
    String uri, {
    JSON? data,
    JSON? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<JSON> response = await _dio.delete<JSON>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return BaseResponse<R>.fromJson(response.data!);
    } catch (e) {
      rethrow;
    }
  }

  // BaseResponse<T> _createResponse(Response<dynamic> httpResponse) {
  //   print(httpResponse.data['data']);
  //   switch (httpResponse.statusCode) {
  //     case 200:
  //       final BaseRespose<T> baseResponse =
  //           BaseRespose<T>.fromJson(httpResponse.data as Map<String, dynamic>);
  //       print(baseResponse.data);
  //       return baseResponse;

  //     case 204:
  //       final Map<String, dynamic> defaultResponse = <String, dynamic>{
  //         'status': false,
  //         'data': T,
  //         'message': '204 Response',
  //       };
  //       final BaseRespose<T> baseResponse =
  //           BaseRespose<T>.fromJson(defaultResponse);
  //       return baseResponse;
  //     default:
  //       final Map<String, dynamic> error = <String, dynamic>{
  //         'status': false,
  //         'data': <dynamic>[],
  //         'message': 'something went worng',
  //       };
  //       final BaseRespose<T> baseResponse = BaseRespose<T>.fromJson(error);
  //       return baseResponse;
  //   }
  // }
}
