import 'package:flutter_boilerplate/model/api_models/api_error.dart';
import 'package:flutter_boilerplate/model/news_api_models/news_response.dart.dart';
import 'package:flutter_boilerplate/model/post_api_models/post_model.dart';
enum PostStatus { initial, success, failure }

class PostState {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <PostModel>[],
    this.hasReachedMax = false,
    this.isLoading = false,
    this.error,
    this.isCompleted = false,
  });

  final PostStatus status;
  final List<PostModel> posts;
  final bool hasReachedMax;
  final bool isLoading;
  final ApiError? error;
  final bool isCompleted;
  PostState copyWith({
    PostStatus? status,
    List<PostModel>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
