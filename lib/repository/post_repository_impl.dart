import 'package:flutter_boilerplate/api_client/http_client.dart';
import 'package:flutter_boilerplate/constants/app_constants.dart';
import 'package:flutter_boilerplate/model/post_api_models/post_model.dart';
import 'package:flutter_boilerplate/repository/post_repository.dart';
import 'package:get_it/get_it.dart';


class PostRepositoryImpl extends PostRepository {
  final _httpClient = GetIt.I<HttpClients>();

  @override
  Future<List<PostModel>> fetchPosts({int startIndex = 0}) async {
    try {
      final response = await _httpClient.get(
          'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=${AppConstants.postLimit}');

      return (response as List).map((p) => PostModel.fromJson(p)).toList();
    } catch (error) {
      print("onError: $error");
      throw Exception('error fetching posts');
    }
  }
}
