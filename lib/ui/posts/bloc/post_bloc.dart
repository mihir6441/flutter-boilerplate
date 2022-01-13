import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/repository/post_repository.dart';
import 'package:get_it/get_it.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostListEvent, PostState> {
  final _postRepository = GetIt.I<PostRepository>();

  PostBloc() : super(PostState()) {
    on<PostListEvent>(_onPostFetched);
  }

  Future<void> _onPostFetched(
    PostListEvent event,
    Emitter<PostState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _postRepository.fetchPosts();
        return emit(state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasReachedMax: false,
        ));
      }
      final posts =
          await _postRepository.fetchPosts(startIndex: state.posts.length);
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}
