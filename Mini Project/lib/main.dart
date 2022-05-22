import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal1/components/bottom_bar.dart';
import 'package:soal1/screens/LoginForm.dart';
import 'package:soal1/viewmodel/viewmodel.dart';

// void main() => runApp(MaterialApp(
//       home: ButtomBar(),
//       debugShowCheckedModeBanner: false,
//     ));

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
        home: LoginForm(),
      ),
    );
  }
}
