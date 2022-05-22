import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:soal1/model/api/data_contact.dart';

import '../model/api/api_dio.dart';

class ContactViewModel extends ChangeNotifier {
  List<Article> _articles = [];
  List<Article> get articles => List.unmodifiable(_articles);
  ContactViewModel() {
    ambilData();
  }

  void ambilData() async {
    final result = await ApiDio().getDataNews();
    _articles = result.articles;
    notifyListeners();
  }
}
