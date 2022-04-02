import 'package:flutter/material.dart';
import 'data_form.dart';

class DataManager extends ChangeNotifier {
  final _dataForm = <DataForm>[];
  List<DataForm> get dataForm => List.unmodifiable(_dataForm);

  void deleteData(int index) {
    _dataForm.removeAt(index);
    notifyListeners();
  }

  void addData(DataForm form) {
    _dataForm.add(form);
    notifyListeners();
  }
}
