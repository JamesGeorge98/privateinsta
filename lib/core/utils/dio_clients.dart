import 'dart:developer';

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
      return _createResponse(response);
    } catch (e) {
      log('Error in get Dio', error: e);
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
      log('Error in post Dio', error: e);
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
      log('Error in put Dio', error: e);
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
      log('Error in delete Dio', error: e);
      rethrow;
    }
  }

  BaseResponse<R> _createResponse<R>(Response<dynamic> httpResponse) {
    switch (httpResponse.statusCode) {
      case 200:
        final BaseResponse<R> baseResponse =
            BaseResponse<R>.fromJson(httpResponse.data as JSON);
        return baseResponse;
      case 204:
        final JSON defaultResponse = <String, dynamic>{
          'status': false,
          'message': '204 Response',
        };
        final BaseResponse<R> baseResponse =
            BaseResponse<R>.fromJson(defaultResponse);
        return baseResponse;
      default:
        final JSON error = <String, dynamic>{
          'status': false,
          'data': <dynamic>[],
          'message': 'something went worng',
        };
        final BaseResponse<R> baseResponse = BaseResponse<R>.fromJson(error);
        return baseResponse;
    }
  }
}
