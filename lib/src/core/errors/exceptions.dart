// src/core/errors/app_exceptions.dart

// Base class for all custom exceptions
class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, {this.statusCode});

  @override
  String toString() {
    return 'AppException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
  }
}

// Specific network-related exceptions
class FetchDataException extends AppException {
  FetchDataException([String? message, int? statusCode])
    : super(message ?? 'Error During Communication', statusCode: statusCode);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, int? statusCode])
    : super(message ?? 'Invalid Request', statusCode: statusCode);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message, int? statusCode])
    : super(message ?? 'Unauthorised', statusCode: statusCode);
}

class ServerException extends AppException {
  ServerException([String? message, int? statusCode])
    : super(message ?? 'Internal Server Error', statusCode: statusCode);
}
