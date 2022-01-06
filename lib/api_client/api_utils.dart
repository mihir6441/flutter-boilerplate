import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/model/api_models/api_error.dart';

class ApiUtils {
  ApiUtils._();

  static ApiError getApiError(DioError error) {
    final response = error.response;
    if (response != null) {
      final data = response.data;
      if (data != null) {
        return ApiError.fromJson(data);
      } else {
        return ApiError();
      }
    } else {
      return ApiError.fromMessage(error.message);
    }
  }
}
