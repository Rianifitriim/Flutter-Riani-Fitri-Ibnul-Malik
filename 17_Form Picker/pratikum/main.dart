import 'package:flutter/material.dart';
import '../model/data_manager.dart';
import '../screen/add_data.dart';
import '../screen/empty_home.dart';
import 'screen/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataManager(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Form Picker',
        home: tampilanControl(),
      ),
    );
  }

  tampilanControl() {
    return Consumer<DataManager>(
      builder: ((context, manager, child) {
        if (manager.dataForm.isNotEmpty) {
          return HomePage(dataManager: manager);
        } else {
          return const EmptyHome();
        }
      }),
    );
  }
}
