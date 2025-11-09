import 'package:dio/dio.dart';
import 'package:inilabs_assignment/core/network/api_constants.dart';
import 'package:inilabs_assignment/core/services/error_message_handler.dart';
import 'package:inilabs_assignment/core/utility/logger_utility.dart';
import 'package:inilabs_assignment/core/utility/trial_utility.dart';

/// API Client for handling HTTP requests using Dio
/// This class follows Singleton pattern and provides methods for GET, POST, PUT, DELETE
class ApiClient {
  static ApiClient? _instance;
  late final Dio _dio;
  final ErrorMessageHandler _errorMessageHandler;

  ApiClient._internal({ErrorMessageHandler? errorMessageHandler})
    : _errorMessageHandler = errorMessageHandler ?? ErrorMessageHandlerImpl() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.githubBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: _defaultHeaders,
      ),
    );

    // Add interceptors if needed (without heavy logging)
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logDebug('Request: ${options.method} ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logDebug(
            'Response: ${response.statusCode} ${response.requestOptions.uri}',
          );
          return handler.next(response);
        },
        onError: (error, handler) {
          final errorMessage = _errorMessageHandler.generateErrorMessage(error);
          logError('Error: $errorMessage', error.stackTrace);
          return handler.next(error);
        },
      ),
    );
  }

  /// Get singleton instance
  factory ApiClient({ErrorMessageHandler? errorMessageHandler}) {
    _instance ??= ApiClient._internal(errorMessageHandler: errorMessageHandler);
    return _instance!;
  }

  /// Default headers for all requests
  Map<String, String> get _defaultHeaders => {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  /// GET request
  Future<Response?> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await catchAndReturnFuture(() async {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    });
  }

  /// POST request
  Future<Response?> post({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await catchAndReturnFuture(() async {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    });
  }

  /// PUT request
  Future<Response?> put({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await catchAndReturnFuture(() async {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    });
  }

  /// DELETE request
  Future<Response?> delete({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await catchAndReturnFuture(() async {
      final response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    });
  }
}
