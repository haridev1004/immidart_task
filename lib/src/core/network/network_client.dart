// src/core/network/network_client.dart

import 'package:dio/dio.dart';
import 'package:immidart_task/src/core/errors/dio_exceptions.dart';

// This class defines the public methods and executes the calls using the injected Dio.
class NetworkClient {
  final Dio _dio;

  // The constructor takes a Dio instance (from ApiClient)
  NetworkClient(this._dio);

  // ==============
  // 1. GET Method
  // ==============
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  // ==============
  // 2. POST Method
  // ==============
  Future<Response> post(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  // ==============
  // 3. PUT Method
  // ==============
  Future<Response> put(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  // ==============
  // 4. DELETE Method
  // ==============
  Future<Response> delete(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
