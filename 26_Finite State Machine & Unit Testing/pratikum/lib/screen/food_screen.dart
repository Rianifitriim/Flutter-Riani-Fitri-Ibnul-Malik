import 'package:flutter/material.dart';
import 'package:lengkap26/screen/food_view_model.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatefulWidget {
  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  void iniState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<FoodViewModel>(context, listen: false);
      await viewModel.getAllFood();
    });
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<FoodViewModel>(context, listen: false).getAllFood();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<FoodViewModel>(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 218, 227),
        appBar: AppBar(
          title: Text('Contacts'),
          backgroundColor: Colors.purpleAccent.shade400,
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: modelView.food.length,
              itemBuilder: (context, int index) {
                final food = modelView.food[index];
                return ListTile(
                  title: Text(food.id.toString()),
                  subtitle: Text(food.name),
                );
              }),
        ));
  }
}

Widget listView(FoodViewModel viewModel) {
  return ListView.builder(
      itemCount: viewModel.food.length,
      itemBuilder: (context, index) {
        final food = viewModel.food[index];
        return ListTile(
          title: Text(
            food.name,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          trailing: Text(
            food.id.toString(),
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        );
      });
}

Widget body(FoodViewModel viewModel) {
  final isLoading = viewModel.state == FoodViewState.loading;

  final isError = viewModel.state == FoodViewState.error;

  if (isLoading) {
    return const Center(child: CircularProgressIndicator());
  }

  if (isError) {
    return const Center(child: Text("gagal ambil data"));
  }

  return listView(viewModel);
}
