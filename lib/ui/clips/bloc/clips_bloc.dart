import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/repository/clips_repository.dart';
import 'package:get_it/get_it.dart';

import 'clips_event.dart';
import 'clips_state.dart';

class ClipsBloc extends Bloc<ClipsListEvent, ClipsState> {
  final _clipsRepository = GetIt.I<ClipsRepository>();

  ClipsBloc() : super(const ClipsState()) {
    on<ClipsListEvent>(_onClipsFetched);
  }

  Future<void> _onClipsFetched(
    ClipsListEvent event,
    Emitter<ClipsState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == ClipStatus.initial) {
        final clipsResponse =
            await _clipsRepository.getClipsList(event.page!, event.perPage!);
        return emit(state.copyWith(
          clips: clipsResponse.clipsDataList,
          status: ClipStatus.success,
          clipResponse: clipsResponse,
          hasReachedMax: false,
        ));
      }
      final clipsResponse =
          await _clipsRepository.getClipsList(event.page!, event.perPage!);
      clipsResponse.pagination?.hasMorePages == false
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: ClipStatus.success,
                clipResponse: clipsResponse,
                clips: List.of(state.clips ?? [])
                  ..addAll(clipsResponse.clipsDataList ?? []),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: ClipStatus.failure));
    }
  }
}
