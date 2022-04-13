import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/data_contact.dart';
import 'data_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(const DataState(list: [])) {
    ambilData();
  }

  late SharedPreferences _sharedPreferences;
  List<DataContact> listItem = [];

  void ambilData() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    ambilDataPref();
    emit(DataState(list: listItem));
  }

  void tambahData(DataContact contactsModel) {
    listItem.add(contactsModel);
    simpanDataPref();
    emit(DataState(list: listItem));
  }

  void ambilDataPref() {
    List<String>? listData = _sharedPreferences.getStringList('data');
    if (listData != null) {
      listItem = listData
          .map((dataContact) => DataContact.fromJson(jsonDecode(dataContact)))
          .toList();
    }
  }

  void simpanDataPref() {
    List<String> dataList = listItem
        .map((dataContact) => jsonEncode(dataContact.toJson()))
        .toList();
    _sharedPreferences.setStringList('data', dataList);
  }
}
