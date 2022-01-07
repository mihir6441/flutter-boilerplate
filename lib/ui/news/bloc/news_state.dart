import 'package:flutter_boilerplate/model/api_models/api_error.dart';
import 'package:flutter_boilerplate/model/news_api_models/news_response.dart.dart';

class NewsState {
  final bool isLoading;
  final ApiError? error;
  final bool isCompleted;
  final bool isEmailVerified;
  final NewsResponse? newsResponse;
  NewsState({
    this.isLoading = false,
    this.error,
    this.isCompleted = false,
    this.isEmailVerified = false,
    this.newsResponse,
  });
}
