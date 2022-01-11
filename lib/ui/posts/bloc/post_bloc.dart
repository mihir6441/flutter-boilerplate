import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/model/api_models/api_status.dart';
import 'package:flutter_boilerplate/repository/news_repository.dart';
import 'package:get_it/get_it.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostListEvent, PostState> {
  final _newsRepository = GetIt.I<NewsRepository>();
  //const _postLimit = 20;

  PostBloc() : super(PostState()) {
    on<PostListEvent>(_fetchNews);
  }

  void _fetchNews(PostListEvent event, Emitter<PostState> emit) async {
    emit(PostState(isLoading: true));
    final response = await _newsRepository.fetchNews();
    if (response.status == ApiStatus.success) {
      emit(PostState(
        newsResponse: response.data,
        isCompleted: true,
      ));
    } else {
      emit(PostState(error: response.error));
    }
  }

}
