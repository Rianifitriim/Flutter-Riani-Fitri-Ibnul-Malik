// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';

import 'model/data_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        return Homepage(dataManager: manager);
      }),
    );
  }
}
