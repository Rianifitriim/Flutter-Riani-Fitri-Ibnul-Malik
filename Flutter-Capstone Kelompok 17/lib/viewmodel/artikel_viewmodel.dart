import 'package:flutter/material.dart';
import 'package:kel17/model/api/api_dio.dart';
import 'package:kel17/model/data_contact.dart';

class ArticleViewModel extends ChangeNotifier {
  List<Article> _articles = [];
  List<Article> get articles => List.unmodifiable(_articles);

  ArticleViewModel() {
    ambilData();
  }

  void ambilData() async {
    final result = await ApiDio().getDataNews();
    _articles = result.articles;
    notifyListeners();
  }
}
