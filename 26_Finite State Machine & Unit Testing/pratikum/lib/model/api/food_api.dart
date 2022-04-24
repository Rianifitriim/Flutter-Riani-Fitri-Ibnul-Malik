import 'package:lengkap26/model/food_model.dart';
import 'package:dio/dio.dart';

class FoodApi {
  Future<List<Food>> getFoods() async {
    final response = await Dio().get(
        "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods");

    List<Food> food = (response.data as List)
        .map((e) => Food(id: e['id'], name: e['name']))
        .toList();

    return food;
  }
}
