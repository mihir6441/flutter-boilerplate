import 'package:flutter_boilerplate/model/clips_api_models/clips_model.dart';

abstract class ClipsRepository {
  Future<ClipsModel> getClipsList(int page, int perPage);
}
