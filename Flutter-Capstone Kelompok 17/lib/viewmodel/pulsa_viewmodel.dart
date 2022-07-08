import 'package:flutter/material.dart';

import '../model/api/api_sweetpoint.dart';
import '../model/data_pulsa.dart';

class PulsaViewModel extends ChangeNotifier {
  ApiPulsa apiPulsa = ApiPulsa();
  List<Data> _data = [];
  List<Data> get data => _data;

  Future pulsa() async {
    final pulsa = await apiPulsa.getDataPulsa();
    _data = pulsa.data!;
    notifyListeners();
  }
}
