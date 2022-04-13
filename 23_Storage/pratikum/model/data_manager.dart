import 'dart:convert';

import 'package:flutter/material.dart';
import 'data_contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataManager extends ChangeNotifier {
  late SharedPreferences _sharedPreferences;
  var _dataContact = <DataContact>[];
  List<DataContact> get dataContact => List.unmodifiable(_dataContact);

  DataManager() {
    ambilData();
  }

  void ambilData() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    ambilDataPref();
    notifyListeners();
  }

  void addData(DataContact contact) {
    _dataContact.add(contact);
    simpanDataPref();
    notifyListeners();
  }

  void ambilDataPref() {
    List<String>? listData = _sharedPreferences.getStringList('data');
    if (listData != null) {
      _dataContact = listData
          .map((dataContact) => DataContact.fromJson(jsonDecode(dataContact)))
          .toList();
    }
    notifyListeners();
  }

  void simpanDataPref() {
    List<String> dataList = _dataContact
        .map((dataContact) => jsonEncode(dataContact.toJson()))
        .toList();
    _sharedPreferences.setStringList('data', dataList);
    notifyListeners();
  }
}
