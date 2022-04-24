import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lengkap25/model/api/api_dio.dart';
import 'package:lengkap25/model/data_contact.dart';
import 'package:lengkap25/screen/detail_contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactViewModel extends ChangeNotifier {
  late SharedPreferences _sharedPreferences;
  var _dataContact = <DataContact>[];
  List<DataContact> get dataContact => List.unmodifiable(_dataContact);
  DataContact _detailContact = DataContact(id: 0, name: '', phone: '');
  DataContact get detailContact => _detailContact;

  ContactViewModel() {
    ambilData();
  }

  void ambilData() async {
    print('coba');

    _sharedPreferences = await SharedPreferences.getInstance();
    _dataContact = await ApiDio().getDataContacts();
    // ApiDio().getIdDataContacts();
    // List.from(_dataContact).addAll();
    ambilDataPref();
    notifyListeners();
  }

  void ambilDetailData(int id) async {
    _detailContact = await ApiDio().getIdDataContacts(id);
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
