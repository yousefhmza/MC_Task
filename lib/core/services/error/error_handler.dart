import 'package:dio/dio.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(Exception error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = ErrorType.unKnown.getFailure();
    }
  }

  Failure _handleError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ErrorType.connectTimeOut.getFailure();
      case DioErrorType.sendTimeout:
        return ErrorType.sendTimeOut.getFailure();
      case DioErrorType.receiveTimeout:
        return ErrorType.receiveTimeOut.getFailure();
      case DioErrorType.response:
        {
          if (dioError.response?.statusMessage != null &&
              dioError.response?.statusCode != null) {
            return Failure(
              dioError.response!.statusCode!,
              dioError.response!.data["message"],
            );
          } else {
            return ErrorType.unKnown.getFailure();
          }
        }
      case DioErrorType.cancel:
        return ErrorType.cancel.getFailure();
      case DioErrorType.other:
        return ErrorType.unKnown.getFailure();
    }
  }
}

enum ErrorType {
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  noInternetConnection,
  unKnown,
}

extension ErrorTypeExtension on ErrorType {
  Failure getFailure() {
    switch (this) {
      case ErrorType.connectTimeOut:
        return Failure(
            ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);
      case ErrorType.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case ErrorType.receiveTimeOut:
        return Failure(
          ResponseCode.receiveTimeOut,
          ResponseMessage.receiveTimeOut,
        );
      case ErrorType.sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);
      case ErrorType.noInternetConnection:
        return Failure(
          ResponseCode.noInternetConnection,
          ResponseMessage.noInternetConnection,
        );
      case ErrorType.unKnown:
        return Failure(ResponseCode.unKnown, ResponseMessage.unKnown);
    }
  }
}

class ResponseCode {
  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int noInternetConnection = -6;
  static const int unKnown = -8;
}

class ResponseMessage {
  static const String connectTimeOut = "برجاء التأكد من إتصالك بالإنترنت";
  static const String cancel = "تم إلغاء الطلب!! حاول مجددا";
  static const String receiveTimeOut = "برجاء التأكد من إتصالك بالإنترنت";
  static const String sendTimeOut = "برجاء التأكد من إتصالك بالإنترنت";
  static const String noInternetConnection = "برجاء التأكد من إتصالك بالإنترنت";
  static const String unKnown = "حدث خطأ ما!! حاول مجددا";
}
