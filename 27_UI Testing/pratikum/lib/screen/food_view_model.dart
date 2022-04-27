import 'package:flutter/material.dart';
import 'package:lengkap26/model/api/food_api.dart';
import 'package:lengkap26/model/food_model.dart';
import 'package:provider/provider.dart';

enum FoodViewState {
  none,
  loading,
  error,
}

class FoodViewModel with ChangeNotifier {
  FoodViewState _state = FoodViewState.none;
  FoodViewState get state => _state;

  changeState(FoodViewState s) {
    _state = s;
    notifyListeners();
  }

  List<Food> _food = [];

  List<Food> get food => _food;

  getAllFood() async {
    changeState(FoodViewState.loading);

    try {
      final f = await FoodApi().getFoods();
      _food = f;
      notifyListeners();
      changeState(FoodViewState.none);
    } catch (e) {
      changeState(FoodViewState.error);
    }
  }

  getFoods() {}
}
