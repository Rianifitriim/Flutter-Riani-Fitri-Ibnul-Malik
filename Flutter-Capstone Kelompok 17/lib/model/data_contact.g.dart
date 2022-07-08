// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataNews _$DataNewsFromJson(Map<String, dynamic> json) => DataNews(
      status: json['status'] as String,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataNewsToJson(DataNews instance) => <String, dynamic>{
      'status': instance.status,
      'articles': instance.articles,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      author: json['author'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String?,
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
      'source': instance.source,
    };

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      name: json['name'] as String,
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'name': instance.name,
    };
