import 'package:flutter/material.dart';
import 'data_contact.dart';

class DataManager extends ChangeNotifier {
  final _dataContact = <DataContact>[];
  List<DataContact> get dataContact => List.unmodifiable(_dataContact);

  void addData(DataContact contact) {
    _dataContact.add(contact);
    notifyListeners();
  }
}
