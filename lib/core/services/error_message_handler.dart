import 'package:dio/dio.dart';
import 'package:inilabs_assignment/core/network/api_constants.dart';

abstract class ErrorMessageHandler {
  String generateErrorMessage(Object error);
}

class ErrorMessageHandlerImpl implements ErrorMessageHandler {
  @override
  String generateErrorMessage(Object error) {
    // Handle DioException specifically
    if (error is DioException) {
      return _handleDioException(error);
    }

    // Handle FormatException
    if (error is FormatException) {
      return 'Data format is not correct';
    }

    // Handle TypeError
    if (error is TypeError) {
      return 'Invalid data type encountered';
    }

    // Default error message
    return error.toString();
  }

  String _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiConstants.connectionTimeoutMessage;
      case DioExceptionType.sendTimeout:
        return ApiConstants.sendTimeoutMessage;
      case DioExceptionType.receiveTimeout:
        return ApiConstants.receiveTimeoutMessage;
      case DioExceptionType.badCertificate:
        return ApiConstants.badCertificateMessage;
      case DioExceptionType.badResponse:
        return _handleBadResponse(error);
      case DioExceptionType.cancel:
        return ApiConstants.requestCancelledMessage;
      case DioExceptionType.connectionError:
        return ApiConstants.connectionErrorMessage;
      case DioExceptionType.unknown:
        return ApiConstants.unknownErrorMessage;
    }
  }

  String _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    switch (statusCode) {
      case 400:
        return ApiConstants.badRequestMessage;
      case 401:
        return ApiConstants.unauthorizedMessage;
      case 403:
        return ApiConstants.forbiddenMessage;
      case 404:
        return ApiConstants.notFoundMessage;
      case 500:
        return ApiConstants.serverErrorMessage;
      case 503:
        return ApiConstants.serviceUnavailableMessage;
      default:
        return 'Server error (${statusCode ?? 'unknown'})';
    }
  }
}
