import 'package:flutter/material.dart';
import 'package:kel17/constant/pref_key.dart';
import 'package:kel17/model/login/data_login.dart';
import 'package:kel17/model/login/resp_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/api/api_sweetpoint.dart';

class LoginViewModel extends ChangeNotifier {
  AuthLogin authLogin = AuthLogin();

  LoginViewModel() {
    ambilData();
  }

  RespLogin? loginData;
  SharedPreferences? preferences;
  Future login(DataLogin dataLogin) async {
    try {
      final login = await authLogin.login(dataLogin);

      if (login.data != null) {
        loginData = login;
        preferences = await SharedPreferences.getInstance();
        await preferences!.setString(PrefKey.token, loginData!.data!.token!);
      }
    } catch (e) {
      print('error');
    }
  }

  void ambilData() async {
    // dataProfile;
    notifyListeners();
  }
}
