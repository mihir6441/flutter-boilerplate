import 'package:flutter_boilerplate/model/api_models/api_error.dart';
import 'package:flutter_boilerplate/model/clips_api_models/clips_data.dart';
import 'package:flutter_boilerplate/model/clips_api_models/clips_model.dart';

enum ClipStatus { initial, success, failure }

class ClipsState {
  const ClipsState({
    this.status = ClipStatus.initial,
    this.clips = const <ClipsData>[],
    this.hasReachedMax = false,
    this.isLoading = false,
    this.error,
    this.clipResponse,
    this.isCompleted = false,
  });

  final ClipStatus status;
  final List<ClipsData>? clips;
  final bool hasReachedMax;
  final bool isLoading;
  final ApiError? error;
  final bool isCompleted;
  final ClipsModel? clipResponse;

  ClipsState copyWith({
    ClipStatus? status,
    ClipsModel? clipResponse,
    List<ClipsData>? clips,
    bool? hasReachedMax,
  }) {
    return ClipsState(
      status: status ?? this.status,
      clipResponse: clipResponse ?? this.clipResponse,
      clips: clips ?? this.clips,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
