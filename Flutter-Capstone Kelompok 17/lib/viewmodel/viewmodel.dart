import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kel17/model/profile.dart/data_profile.dart' as profile;
import '../model/api/api_sweetpoint.dart';

class ContactViewModel extends ChangeNotifier {
  // AuthAPI authAPI = AuthAPI();
  // AuthLogin authLogin = AuthLogin();
  ApiPulsa apiPulsa = ApiPulsa();
  AuthProfile authProfile = AuthProfile();
  profile.DataProfile? dataProfile;
  profile.DataProfile get profileData => dataProfile!;
  // List<Data> _data = [];
  // List<Data> get data => List.unmodifiable(_data);
  // List<Article> _articles = [];
  // List<Article> get articles => List.unmodifiable(_articles);
  // late profile.Data _dataProfile;
  // profile.Data get dataProfile => _dataProfile;

  // ContactViewModel() {
  //   ambilData();
  // }
  // RespLogin? loginData;
  // SharedPreferences? preferences;
  // Future<RespRegis> regis(DataRegis dataRegis) async {
  //   final regis = await authAPI.register(dataRegis);
  //   return regis;
  // }

  Future<profile.DataProfile> profil() async {
    final profile = await authProfile.profile();
    dataProfile = profile;
    // _dataProfile = profile.data!;
    notifyListeners();
    return profile;
  }

  // Future pulsa() async {
  //   final pulsa = await apiPulsa.getDataPulsa();
  //   // _data = pulsa.data!;
  //   notifyListeners();
  // }

  // Future login(DataLogin dataLogin) async {
  //   try {
  //     final login = await authLogin.login(dataLogin);

  //     if (login.data != null) {
  //       loginData = login;
  //       preferences = await SharedPreferences.getInstance();
  //       await preferences!.setString(PrefKey.token, loginData!.data!.token!);
  //     }
  //   } catch (e) {
  //     print('error');
  //   }
  // }

  void ambilData() async {
    final profil = await AuthProfile().profile();
    // final result = await ApiDio().getDataNews();
    // final pulsa = await apiPulsa.getDataPulsa();
    // _data = pulsa.data!;
    // _articles = result.articles;
    dataProfile;
    notifyListeners();
  }
}
