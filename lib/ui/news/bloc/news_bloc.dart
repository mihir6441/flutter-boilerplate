import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/model/api_models/api_status.dart';
import 'package:flutter_boilerplate/repository/news_repository.dart';
import 'package:get_it/get_it.dart';

import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsListEvent, NewsState> {
  final _newsRepository = GetIt.I<NewsRepository>();

  NewsBloc() : super(NewsState()) {
    on<NewsListEvent>(_fetchNews);
  }

  void _fetchNews(NewsListEvent event, Emitter<NewsState> emit) async {
    emit(NewsState(isLoading: true));
    final response = await _newsRepository.fetchNews();
    if (response.status == ApiStatus.success) {
      emit(NewsState(
        newsResponse: response.data,
        isCompleted: true,
      ));
    } else {
      emit(NewsState(error: response.error));
    }
  }

}
