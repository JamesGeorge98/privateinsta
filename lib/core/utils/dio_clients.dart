import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:privateinsta/core/constants/endpoints.dart';

class BaseRespose<T> {
  BaseRespose({this.status, this.data, this.message, this.error});

  factory BaseRespose.fromJson(Map<String, dynamic> json) {
    print(T);
    print(json['data'] as T);
    return BaseRespose<T>(
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

class DioClient<T> {
  // dio instance
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: const Duration(seconds: Endpoints.connectionTimeout),
      receiveTimeout: const Duration(seconds: Endpoints.receiveTimeout),
    ),
  );

  // Get:-----------------------------------------------------------------------
  Future<BaseRespose<T>> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<dynamic> response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return _createResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  BaseRespose<T> _createResponse(Response<dynamic> httpResponse) {
    print(httpResponse.data['data']);
    switch (httpResponse.statusCode) {
      case 200:
        final BaseRespose<T> baseResponse =
            BaseRespose<T>.fromJson(httpResponse.data as Map<String, dynamic>);
        print(baseResponse.data);
        return baseResponse;

      case 204:
        final Map<String, dynamic> defaultResponse = <String, dynamic>{
          'status': false,
          'data': T,
          'message': '204 Response',
        };
        final BaseRespose<T> baseResponse =
            BaseRespose<T>.fromJson(defaultResponse);
        return baseResponse;
      default:
        final Map<String, dynamic> error = <String, dynamic>{
          'status': false,
          'data': <dynamic>[],
          'message': 'something went worng',
        };
        final BaseRespose<T> baseResponse = BaseRespose<T>.fromJson(error);
        return baseResponse;
    }
  }
}
