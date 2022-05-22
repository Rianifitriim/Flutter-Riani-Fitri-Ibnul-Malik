import 'package:dio/dio.dart';
import 'package:soal1/model/api/data_contact.dart';

class ApiDio {
  Future<DataNews> getDataNews() async {
    Response response = await Dio().get(
        'https://newsapi.org/v2/top-headlines?country=id&apikey=b0ef81c652504ea5b7edf7a7aa03577b');

    return DataNews.fromJson(response.data);
  }
}
