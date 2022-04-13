import 'package:flutter/material.dart';
import 'package:lengkap23/bloc/homebloc.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';
import 'model/data_manager.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homescreen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeProvider(),
                  ),
                );
              },
              child: const Text('Provider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeBloc(),
                  ),
                );
              },
              child: const Text('Bloc'),
            )
          ],
        ),
      ),
    );
  }
}

HomeProvider() {
  return Consumer<DataManager>(
    builder: ((context, manager, child) {
      return Homepage(dataManager: manager);
    }),
  );
}
