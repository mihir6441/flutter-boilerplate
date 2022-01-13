
import 'package:flutter_boilerplate/model/post_api_models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> fetchPosts({int startIndex = 0});
}
