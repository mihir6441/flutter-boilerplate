class ClipsData {
  String? clip;
  String? description;
  int? id;
  String? screenshot;

  ClipsData({this.clip, this.description, this.id, this.screenshot});

  factory ClipsData.fromJson(Map<String, dynamic> json) {
    return ClipsData(
      clip: json['clip'],
      description: json['description'],
      id: json['id'],
      screenshot: json['screenshot'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clip'] = clip;
    data['id'] = id;
    data['screenshot'] = screenshot;
    if (description != null) {
      data['description'] = description;
    }
    return data;
  }
}
