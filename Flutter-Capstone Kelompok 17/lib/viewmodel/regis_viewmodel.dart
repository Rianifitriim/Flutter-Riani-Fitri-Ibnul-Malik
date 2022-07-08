import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kel17/constant/pref_key.dart';
import 'package:kel17/model/register/data_regis.dart';
import 'package:kel17/model/register/resp_regis.dart';
import '../model/api/api_sweetpoint.dart';

class RegisViewModel extends ChangeNotifier {
  AuthAPI authAPI = AuthAPI();

  RegisViewModel() {
    ambilData();
  }

  Future<RespRegis> regis(DataRegis dataRegis) async {
    final regis = await authAPI.register(dataRegis);
    return regis;
  }

  void ambilData() async {
    notifyListeners();
  }
}
