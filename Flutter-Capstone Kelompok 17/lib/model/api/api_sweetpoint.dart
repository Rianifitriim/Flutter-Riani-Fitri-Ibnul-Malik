import 'package:dio/dio.dart';
import 'package:kel17/constant/pref_key.dart';
import 'package:kel17/model/data_pulsa.dart';
import 'package:kel17/model/login/data_login.dart';
import 'package:kel17/model/login/resp_login.dart';
import 'package:kel17/model/profile.dart/data_profile.dart';
import 'package:kel17/model/profile.dart/resp_profile.dart';
import 'package:kel17/model/register/data_regis.dart';
import 'package:kel17/model/register/resp_regis.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthAPI {
  final _dio = Dio();
  final _baseUrl = "http://54.84.135.87/v1";
  Future register(DataRegis dataRegis) async {
    try {
      Response response = await _dio.post('$_baseUrl/auth/register', data: {
        "email": dataRegis.email,
        "username": dataRegis.username,
        "password": dataRegis.password,
        "name": dataRegis.name,
        "address": dataRegis.address,
        "phone": dataRegis.phone
      });

      final mapJson = RespRegis.fromJson(response.data);
      print(response.data);
      return mapJson;
    } on DioError catch (e) {
      // print(e.response!.statusCode);
      throw Exception(e);
    }
  }
}

class AuthLogin {
  final _dio = Dio();
  final _baseUrl = "http://54.84.135.87/v1";
  Future<RespLogin> login(DataLogin dataLogin) async {
    try {
      Response response = await _dio.post('$_baseUrl/auth/login', data: {
        "username": dataLogin.username,
        "password": dataLogin.password
      });
      final mapJson = RespLogin.fromJson(response.data);
      // print(response.data);
      return mapJson;
    } on DioError catch (e) {
      throw e;
    }
  }
}

class AuthProfile {
  SharedPreferences? preferences;

  final _dio = Dio();
  final _baseUrl = "http://54.84.135.87/v1";
  Future<DataProfile> profile() async {
    try {
      preferences = await SharedPreferences.getInstance();
      final String? token = preferences!.getString(PrefKey.token);
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers["Authorization"] = "Bearer ${token}";
      Response response = await _dio.get('$_baseUrl/auth/info');
      final mapJson = DataProfile.fromJson(response.data);
      print(response.data);
      return mapJson;
    } on DioError catch (e) {
      throw e;
    }
  }
}

class ApiPulsa {
  Future<DataPulsa> getDataPulsa() async {
    Response response = await Dio().get('http://54.84.135.87/v1/product/');

    // print(response.data);
    return DataPulsa.fromJson(response.data);
  }
}
