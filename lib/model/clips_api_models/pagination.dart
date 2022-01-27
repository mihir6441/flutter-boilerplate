class Pagination {
  int? currentPage;
  bool? hasMorePages;
  int? perPage;

  Pagination({this.currentPage, this.hasMorePages, this.perPage});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['currentPage'],
      hasMorePages: json['hasMorePages'],
      perPage: json['perPage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['hasMorePages'] = hasMorePages;
    data['perPage'] = perPage;
    return data;
  }
}
