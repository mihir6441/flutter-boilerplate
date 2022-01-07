import 'package:flutter_boilerplate/model/api_models/api_response.dart';
import 'package:flutter_boilerplate/model/news_api_models/news_response.dart.dart';

abstract class NewsRepository {
  Future<ApiResponse<NewsResponse>> fetchNews();
}
