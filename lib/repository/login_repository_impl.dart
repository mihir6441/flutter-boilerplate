import 'dart:convert';

import 'package:flutter_boilerplate/api_client/api_utils.dart';
import 'package:flutter_boilerplate/model/api_models/api_response.dart';
import 'package:flutter_boilerplate/utils/app_utils.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'login_repository.dart';


class LoginRepositoryImpl extends LoginRepository {
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse> login(
    String email,
    String password,
  ) async {
    final requestData = jsonEncode({
      'email': email,
      'password': password,
      'device_type': AppUtils.getDeviceType(),
      'token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9', /// Token for push notification
      'device_id': await AppUtils.getDeviceId(),
    });
    try {
      final response = await _dio.post('/login', data: requestData);
      return ApiResponse.success(data:response);
    } on DioError catch (error) {
      return ApiResponse.error(error: ApiUtils.getApiError(error));
    }
  }

}
