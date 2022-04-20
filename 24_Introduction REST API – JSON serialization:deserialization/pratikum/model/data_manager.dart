import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lengkap_24/dio/api_dio.dart';
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
    print('coba');
    _sharedPreferences = await SharedPreferences.getInstance();
    _dataContact = await ApiDio().getDataContacts();
    ApiDio().getIdDataContacts();
    // List.from(_dataContact).addAll();
    ambilDataPref();
    notifyListeners();
  }

  void addData(DataContact contact) async {
    final postApi = await ApiDio().postDataContacts(contact);
    _dataContact.add(postApi);
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
