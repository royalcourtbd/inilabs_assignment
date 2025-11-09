/// API related constants for response handling
class ApiConstants {
  ApiConstants._();

  // Status codes
  static const int codeSuccess = 200;
  static const int codeNoInternet = 100;
  static const int codeError = 102;
  static const int codeResponseNull = 103;

  // Parameter names
  static const String paramStatusCode = "status_code";
  static const String paramMessage = "message";
  static const String paramApiKey = "api_key";

  // Base URLs
  static const String githubBaseUrl = "https://api.github.com/";

  // Response messages
  static const String noInternetMessage = "No Internet Connection.";
  static const String unexpectedErrorMessage = "Unexpected error occurred";
  static const String requestCancelledMessage =
      "Request to API server was cancelled";
  static const String receiveTimeoutMessage =
      "Receive timeout in connection with API server";
  static const String sendTimeoutMessage =
      "Send timeout in connection with API server";
  static const String connectionTimeoutMessage =
      "Connection timeout with API server";
  static const String badCertificateMessage =
      'Caused by an incorrect certificate';
  static const String connectionErrorMessage =
      'Caused for example by a `xhr.onError` or SocketExceptions.';
  static const String unknownErrorMessage =
      "Connection to API server failed due to internet connection";

  // HTTP Status Code Messages
  static const String badRequestMessage = "Bad request - Invalid data sent";
  static const String unauthorizedMessage = "Unauthorized - Please login again";
  static const String forbiddenMessage = "Forbidden - Access denied";
  static const String notFoundMessage = "Not found - Resource doesn't exist";
  static const String serverErrorMessage =
      "Server error - Please try again later";
  static const String serviceUnavailableMessage =
      "Service unavailable - Server is down";
}
