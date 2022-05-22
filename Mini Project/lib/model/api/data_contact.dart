import 'package:json_annotation/json_annotation.dart';

part 'data_contact.g.dart';

@JsonSerializable()
class DataNews {
  String status;
  List<Article> articles;

  DataNews({
    required this.status,
    required this.articles,
  });

  factory DataNews.fromJson(Map<String, dynamic> json) =>
      _$DataNewsFromJson(json);

  Map<String, dynamic> toJson() => _$DataNewsToJson(this);
}

@JsonSerializable()
class Article {
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  String publishedAt;
  String? content;
  Source source;

  Article({
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
    required this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class Source {
  String name;

  Source({
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
