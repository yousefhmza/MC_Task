import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../utils/constants.dart';

const String _baseURL = "https://trscar.com/api/";

class DioFactory {
  static late final Dio _dio;

  static Future<void> init() async {
    final BaseOptions _options = BaseOptions(
      baseUrl: _baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: Constants.connectTimeout,
      receiveTimeout: Constants.connectTimeout,
      sendTimeout: Constants.connectTimeout,
      headers: {
        "x-api-key": "mwDA9w",
        "Content-Language": "ar",
        "Content-Country": "1",
      },
    );

    _dio = Dio(_options);

    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(
      url,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> post({
    required String url,
    required var requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.post(
      url,
      queryParameters: queryParameters,
      data: requestBody,
    );
  }

  static Future<Response> update({
    required String url,
    required var requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.put(
      url,
      queryParameters: queryParameters,
      data: requestBody,
    );
  }

  static Future<Response> delete({
    required String url,
    var requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.delete(
      url,
      queryParameters: queryParameters,
      data: requestBody,
    );
  }
}
