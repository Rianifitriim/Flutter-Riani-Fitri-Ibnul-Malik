import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lengkap26/model/api/food_api.dart';
import 'package:lengkap26/model/food_model.dart';
import 'package:lengkap26/screen/food_screen.dart';
import 'package:lengkap26/screen/food_view_model.dart';
import 'package:provider/provider.dart';
import 'package:test/test.dart' as tes;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'food_api_test.mocks.dart';

@GenerateMocks([FoodApi])
void main() {
  group('FoodApi', () {
    FoodApi foodApi = MockFoodApi();
    final _foodViewModel = FoodViewModel();
    test('get all contact returns data', () async {
      when(foodApi.getFoods()).thenAnswer(
        (_) async => <Food>[
          Food(id: 1, name: 'a'),
        ],
      );
      var food = await FoodApi().getFoods();
      expect(food.isNotEmpty, true);

      _foodViewModel.changeState(FoodViewState.none);
      expect(FoodViewState.none, _foodViewModel.state);

      _foodViewModel.changeState(FoodViewState.loading);
      expect(FoodViewState.loading, _foodViewModel.state);

      _foodViewModel.changeState(FoodViewState.error);
      expect(FoodViewState.error, _foodViewModel.state);
    });
  });
  testWidgets('avd', (WidgetTester tester) async {
    await tester.pumpWidget(
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
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.text('Food screen'), findsOneWidget);
  });
}
