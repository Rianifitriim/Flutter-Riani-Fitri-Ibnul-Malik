import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lengkap25/model/data_contact.dart';

class ApiDio {
  Future<List<DataContact>> getDataContacts() async {
    Response<List<dynamic>> response = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');
    print(response);
    if (response.statusCode == 200) {
      List<DataContact>? listContact = response.data
          ?.map((contact) => DataContact.fromJson(contact))
          .toList();
      return listContact ?? [];
    }

    return [];
  }

  Future<DataContact> getIdDataContacts(int id) async {
    try {
      Response response = await Dio().get(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$id');
      final listContact = DataContact.fromJson(response.data);
      print(response.data);
      return listContact;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<DataContact> postDataContacts(DataContact dataModel) async {
    try {
      Response response = await Dio().post(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
        data: json.encode(dataModel.toJson()),
      );
      final mapJson = DataContact.fromJson(response.data);
      print(response.data);
      return mapJson;
    } on DioError catch (e) {
      throw Exception(e);
    }
    // if (response.statusCode == 200) {
    //   return mapJson;
    // }
    // return [];
  }
}
