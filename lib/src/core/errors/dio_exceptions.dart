// src/core/errors/network_error_handler.dart

import 'package:dio/dio.dart';
import 'package:immidart_task/src/core/errors/exceptions.dart';


/// Converts a raw DioException into a custom, domain-specific AppException.
AppException handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return FetchDataException('Connection Timeout. Please try again.');

    case DioExceptionType.badResponse:
      final statusCode = error.response?.statusCode;
      final errorData = error.response?.data;
      final errorMessage = errorData is Map<String, dynamic>
          ? errorData['message']?.toString()
          : 'An unknown error occurred.';

      switch (statusCode) {
        case 400: // Bad Request
          return BadRequestException(errorMessage, statusCode);
        case 401: // Unauthorized
          return UnauthorisedException(errorMessage, statusCode);
        case 403: // Forbidden
          return UnauthorisedException('Access Forbidden', statusCode);
        case 404: // Not Found
          return FetchDataException(
            'Resource not found at ${error.requestOptions.path}',
            statusCode,
          );
        case 500: // Internal Server Error
        case 502: // Bad Gateway
          return ServerException(errorMessage, statusCode);
        default:
          return FetchDataException(
            'Received invalid status code: $statusCode',
            statusCode,
          );
      }

    case DioExceptionType.cancel:
      return FetchDataException('Request to API server was cancelled');

    case DioExceptionType.unknown:
      if (error.message?.contains('SocketException') ?? false) {
        return FetchDataException(
          'No Internet Connection. Check your network settings.',
        );
      }
      return FetchDataException(
        error.message ?? 'An unexpected error occurred.',
      );

    default:
      return FetchDataException('Something went wrong during the request.');
  }
}
