import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/api_client/api_utils.dart';
import 'package:flutter_boilerplate/model/api_models/api_response.dart';
import 'package:flutter_boilerplate/model/news_api_models/news_response.dart.dart';
import 'package:get_it/get_it.dart';

import 'news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<NewsResponse>> fetchNews() async {
    try {
      final response = await _dio.get(
        '/everything?q=india&from=2021-12-07&sortBy=publishedAt&apiKey=63f2b019f13e4a85b0281c2758ba9f17',
      );
      final newsResponse = NewsResponse.fromJson(response.data);
      return ApiResponse.success(data: newsResponse);
    } on DioError catch (error) {
      return ApiResponse.error(error: ApiUtils.getApiError(error));
    }
  }
}
