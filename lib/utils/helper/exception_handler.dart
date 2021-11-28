import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:winkl_project/utils/values/strings.dart';

class APIException implements Exception {
  final String message;

  APIException({required this.message});
}

class ExceptionHandler {
  ExceptionHandler._privateConstructor();

  static APIException handleError(Exception error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          return APIException(message: ErrorMessages.noInternet);
        case DioErrorType.connectTimeout:
          return APIException(message: ErrorMessages.connectionTimeout);
        case DioErrorType.response:
          return APIException(
              message: ErrorResponse.fromJson(error.response?.data).message);
        default:
          return APIException(message: ErrorMessages.noInternet);
      }
    } else {
      return APIException(message: ErrorMessages.networkGeneral);
    }
  }
}

class HandleError {
  HandleError._privateConstructor();

  static handleError(APIException? error) {
    Get.rawSnackbar(message: error?.message ?? ErrorMessages.networkGeneral);
  }
}


class ErrorResponse {
  late String message;

  ErrorResponse({required this.message});

  ErrorResponse.fromJson(json) {
    if (json is String) {
      message = json;
    } else {
      message = json == null ? "" : json['message'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}

