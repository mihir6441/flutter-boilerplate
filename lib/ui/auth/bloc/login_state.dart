import 'package:flutter_boilerplate/model/api_models/api_error.dart';

class LoginState {
  final bool isLoading;
  final ApiError? error;
  final bool isCompleted;
  final bool isEmailVerified;

  LoginState({
    this.isLoading = false,
    this.error,
    this.isCompleted = false,
    this.isEmailVerified = false,
  });
}
