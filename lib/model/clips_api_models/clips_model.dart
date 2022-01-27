import 'Pagination.dart';
import 'clips_data.dart';

class ClipsModel {
  List<ClipsData>? clipsDataList;
  Pagination? pagination;

  ClipsModel({this.clipsDataList, this.pagination});

  factory ClipsModel.fromJson(dynamic json) {
    return ClipsModel(
      clipsDataList: json['data'] != null
          ? (json['data'] as List).map((i) => ClipsData.fromJson(i)).toList()
          : null,
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clipsDataList != null) {
      data['data'] = clipsDataList?.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination?.toJson();
    }
    return data;
  }
}
