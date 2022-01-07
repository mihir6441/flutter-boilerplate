import 'Article.dart';

class NewsResponse {
  List<Article>? articles;
  String? status;
  int? totalResults;

  NewsResponse({this.articles, this.status, this.totalResults});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      articles: json['articles'] != null
          ? (json['articles'] as List).map((i) => Article.fromJson(i)).toList()
          : null,
      status: json['status'],
      totalResults: json['totalResults'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
