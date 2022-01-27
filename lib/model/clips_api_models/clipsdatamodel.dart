import 'clips_model.dart';

class   ClipsDataModel {
  ClipsModel? clips;

  ClipsDataModel({this.clips});

  factory ClipsDataModel.fromJson(dynamic json) {
    return ClipsDataModel(
      clips: json['clips'] != null ? ClipsModel.fromJson(json['clips']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clips != null) {
      data['clips'] = clips?.toJson();
    }
    return data;
  }
}
