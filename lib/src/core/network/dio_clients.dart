// src/core/network/api_client.dart

import 'package:dio/dio.dart';
// Make sure to import any custom interceptors
// import 'auth_interceptor.dart';
// Use the built-in Dio LogInterceptor (or add pretty_dio_logger package)
import 'package:flutter/foundation.dart';

class DioClients {
  final String baseUrl;

  DioClients({required this.baseUrl});

  Dio get dio {
    final dioInstance = Dio();

    // Set base configuration for the specific client instance
    dioInstance.options.baseUrl = baseUrl;
    dioInstance.options.connectTimeout = const Duration(seconds: 15);
    dioInstance.options.receiveTimeout = const Duration(seconds: 15);

    // =========================================================
    // ADD INTERCEPTORS HERE
    // =========================================================

    // 1. Authentication/Header Interceptor (Should run early)
    // dioInstance.interceptors.add(AuthInterceptor());

    // 2. Logging Interceptor (Generally added last to log final configuration)
    // Only log in Debug/Development builds
    if (kDebugMode) {
      dioInstance.interceptors.add(
        LogInterceptor(
          requestBody: true, // Log request data (body)
          responseBody: true, // Log response data (body)
          requestHeader: true, // Log request headers
          responseHeader:
              false, // Skip logging response headers for cleanliness
        ),
      );
    }

    return dioInstance;
  }
}
