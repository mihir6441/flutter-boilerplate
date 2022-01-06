import 'package:flutter_boilerplate/model/api_models/api_response.dart';

abstract class LoginRepository {
  Future<ApiResponse> login(String email, String password);
}
