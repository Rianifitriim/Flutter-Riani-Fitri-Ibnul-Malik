// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lengkap25/screen/contact/contact_screen.dart';
import 'package:lengkap25/screen/contact/contact_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContactViewModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Storage',
        home: tampilanControl(),
      ),
    );
  }

  tampilanControl() {
    return Consumer<ContactViewModel>(
      builder: ((context, manager, child) {
        return Homepage(dataManager: manager);
      }),
    );
  }
}
