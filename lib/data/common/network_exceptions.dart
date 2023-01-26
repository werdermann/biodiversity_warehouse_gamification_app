import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

/// Represents the type of network exceptions that might occur during the usage
/// of the app
@freezed
class NetworkExceptions with _$NetworkExceptions {
  /// The request is cancelled
  const factory NetworkExceptions.requestCancelled({DioError? error}) =
      RequestCancelled;

  /// User is not authorized to do the request
  const factory NetworkExceptions.unauthorizedRequest({DioError? error}) =
      UnauthorizedRequest;

  /// Bad request
  const factory NetworkExceptions.badRequest({DioError? error}) = BadRequest;

  /// The path of the request was not found
  const factory NetworkExceptions.notFound(String reason, {DioError? error}) =
      NotFound;

  /// Method is not allowed
  const factory NetworkExceptions.methodNotAllowed({DioError? error}) =
      MethodNotAllowed;

  /// Not acceptable
  const factory NetworkExceptions.notAcceptable({DioError? error}) =
      NotAcceptable;

  /// Requested timeout
  const factory NetworkExceptions.requestTimeout({DioError? error}) =
      RequestTimeout;

  /// Send a timeout
  const factory NetworkExceptions.sendTimeout({DioError? error}) = SendTimeout;

  /// On conflict
  const factory NetworkExceptions.conflict({DioError? error}) = Conflict;

  /// Internal server error
  const factory NetworkExceptions.internalServerError({DioError? error}) =
      InternalServerError;

  /// Not implemented
  const factory NetworkExceptions.notImplemented({DioError? error}) =
      NotImplemented;

  /// Service is unavailable
  const factory NetworkExceptions.serviceUnavailable({DioError? error}) =
      ServiceUnavailable;

  /// User has not internet connection
  const factory NetworkExceptions.noInternetConnection({DioError? error}) =
      NoInternetConnection;

  /// The request has a format issue
  const factory NetworkExceptions.formatException({DioError? error}) =
      FormatException;

  /// Unable to process the request/response
  const factory NetworkExceptions.unableToProcess({DioError? error}) =
      UnableToProcess;

  /// Default error
  const factory NetworkExceptions.defaultError(
    String error, {
    DioError? dioError,
  }) = DefaultError;

  /// An unexpected error appeared
  const factory NetworkExceptions.unexpectedError({DioError? error}) =
      UnexpectedError;

  /// Handles the response of the server
  static NetworkExceptions handleResponse(int? statusCode, {DioError? error}) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return NetworkExceptions.unauthorizedRequest(error: error);
      case 404:
        return NetworkExceptions.notFound('Not found', error: error);
      case 409:
        return NetworkExceptions.conflict(error: error);
      case 408:
        return NetworkExceptions.requestTimeout(error: error);
      case 500:
        return NetworkExceptions.internalServerError(error: error);
      case 503:
        return NetworkExceptions.serviceUnavailable(error: error);
      default:
        final responseCode = statusCode;
        return NetworkExceptions.defaultError(
          'Received invalid status code: $responseCode',
        );
    }
  }

  /// Returns the dio exception
  static NetworkExceptions getDioException(dynamic error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions =
                  NetworkExceptions.requestCancelled(error: error);
              break;
            case DioErrorType.connectTimeout:
              networkExceptions =
                  NetworkExceptions.requestTimeout(error: error);
              break;
            case DioErrorType.other:
              networkExceptions =
                  NetworkExceptions.noInternetConnection(error: error);
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = NetworkExceptions.sendTimeout(error: error);
              break;
            case DioErrorType.response:
              networkExceptions = NetworkExceptions.handleResponse(
                error.response?.statusCode,
                error: error,
              );
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = NetworkExceptions.sendTimeout(error: error);
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  /// Returns the error message
  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = '';
    networkExceptions.when(
      notImplemented: (e) {
        errorMessage = 'ERROR.GENERAL';
      },
      requestCancelled: (e) {
        errorMessage = 'ERROR.GENERAL';
      },
      internalServerError: (e) {
        errorMessage = 'ERROR.SERVER_ERROR';
      },
      notFound: (String reason, e) {
        errorMessage = reason;
      },
      serviceUnavailable: (e) {
        errorMessage = 'ERROR.SERVER_UNAVAILABLE';
      },
      methodNotAllowed: (e) {
        errorMessage = 'ERROR.GENERAL';
      },
      badRequest: (e) {
        errorMessage = 'ERROR.GENERAL';
      },
      unauthorizedRequest: (e) {
        errorMessage = 'ERROR.GENERAL';
      },
      unexpectedError: (e) {
        errorMessage = 'ERROR.GENERAL';
      },
      requestTimeout: (e) {
        errorMessage = 'ERROR.SERVER_TIMEOUT';
      },
      noInternetConnection: (e) {
        errorMessage = 'ERROR.NO_INTERNET_CONNECTION';
      },
      conflict: (e) {
        errorMessage = 'ERROR.GENERAL';
      },
      sendTimeout: (e) {
        errorMessage = 'ERROR.GENERAL';
      },
      unableToProcess: (e) {
        errorMessage = 'ERROR.GENERAL';
      },
      defaultError: (String error, e) {
        errorMessage = error;
      },
      formatException: (e) {
        errorMessage = 'ERROR.GENERAL';
      },
      notAcceptable: (e) {
        errorMessage = 'ERROR.GENERAL';
      },
    );
    return errorMessage;
  }

  static DioError? getDioError(NetworkExceptions networkExceptions) {
    DioError? dioError;

    networkExceptions.when(
      notImplemented: (e) {
        dioError = e;
      },
      requestCancelled: (e) {
        dioError = e;
      },
      internalServerError: (e) {
        dioError = e;
      },
      notFound: (String reason, e) {
        dioError = e;
      },
      serviceUnavailable: (e) {
        dioError = e;
      },
      methodNotAllowed: (e) {
        dioError = e;
      },
      badRequest: (e) {
        dioError = e;
      },
      unauthorizedRequest: (e) {
        dioError = e;
      },
      unexpectedError: (e) {
        dioError = e;
      },
      requestTimeout: (e) {
        dioError = e;
      },
      noInternetConnection: (e) {
        dioError = e;
      },
      conflict: (e) {
        dioError = e;
      },
      sendTimeout: (e) {
        dioError = e;
      },
      unableToProcess: (e) {
        dioError = e;
      },
      defaultError: (String error, e) {
        dioError = e;
      },
      formatException: (e) {
        dioError = e;
      },
      notAcceptable: (e) {
        dioError = e;
      },
    );
    return dioError;
  }
}
