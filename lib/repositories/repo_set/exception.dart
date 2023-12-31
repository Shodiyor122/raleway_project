import 'dart:convert';

import 'package:http/http.dart' as http;

/// Constants.
const String _DEFAULT_MESSAGE = "An unexpected error occurred";
const Map<String, dynamic> _DEFAULT_ERRORS = {};

/// Utility class to simplify the use of HTTP errors returned by the backend.
class RepositoryException implements Exception {
  http.Response? raw;
  DateTime creation = DateTime.now();
  String message = _DEFAULT_MESSAGE;
  String messageWithoutSubBody = _DEFAULT_MESSAGE;
  Map<String, dynamic> errorData = {};
  Map<String, dynamic> errors = _DEFAULT_ERRORS;
  int? status;
  int? errorNumber;

  RepositoryException(http.Response errorResponse) {
    raw = errorResponse;

    if (errorResponse.body.isNotEmpty) {
      status = errorResponse.statusCode;
      try {
        // Parse response's body.
        Map<String, dynamic> data = json.decode(errorResponse.body);
        errorNumber = errorResponse.statusCode;
        errorData = data;
        messageWithoutSubBody = data['message'] ?? _DEFAULT_MESSAGE;
        message = data['error']?["details"]?[0]['messages']?[0]["message"] ??
            _DEFAULT_MESSAGE;
        errors = data['errors'] ?? _DEFAULT_ERRORS;
      } catch (e) {
        // If the body wasn't a JSON object, then must be a plain text error.
        message =
            errorResponse.body.isEmpty ? _DEFAULT_MESSAGE : errorResponse.body;
      }
    }
  }

  RepositoryException.err(Exception exp) {
    // Mainly two types of exceptions may occur here:
    // 1. ClientException: Connection closed before full header was received.
    // 2. TypeError: type '(HttpException) => Null' is not a subtype of type '(dynamic) => dynamic'.
    // In both cases we are only interested on the message, not on the full object.
    message = exp.toString();
  }
//TODO: 403 status should be fixed from backend

  bool unauthorized() {
    return status == 401 || status == 400 || status == 403;
  }

  @override
  String toString() => message;
}
