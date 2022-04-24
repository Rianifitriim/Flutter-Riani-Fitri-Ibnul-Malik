import 'package:flutter/material.dart';
import 'package:lengkap26/screen/food_screen.dart';
import 'package:lengkap26/screen/food_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FoodViewModel(),
        )
      ],
      child: MaterialApp(
        home: FoodScreen(),
      ),
    ),
  );
}
