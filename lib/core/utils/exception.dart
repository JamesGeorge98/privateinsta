// ignore_for_file: constant_identifier_names, unused_field

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CustomException implements Exception {
  CustomException({
    required this.message,
    this.code,
    int? statusCode,
  }) : statusCode = statusCode ?? 500;

  factory CustomException.fromDioException(DioException error) {
    try {
      return CustomException(
        message: error.message ?? 'Something Went Wrong',
      );
    } on FormatException catch (e) {
      return CustomException(
        message: e.message,
      );
    } on Exception catch (_) {
      return CustomException(
        message: 'Error unrecognized',
      );
    }
  }

  factory CustomException.fromParsingException(Exception error) {
    debugPrint('$error');
    return CustomException(
      message: 'Failed to parse network response to model or vice versa',
    );
  }

  factory CustomException.somthingWentWrong() {
    return CustomException(
      message: 'Something Went Wrong',
    );
  }

  final String message;
  final String? code;
  final int? statusCode;
}
