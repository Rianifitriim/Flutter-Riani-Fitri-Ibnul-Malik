import 'package:flutter/material.dart';
import 'package:kel17/component/bottom_bar.dart';
import 'package:kel17/page/Homepage.dart';
import 'package:kel17/page/loginn.dart';
import 'package:kel17/page/onboarding_page.dart';
import 'package:kel17/page/register.dart';
import 'package:kel17/page/welcome.dart';
import 'package:kel17/viewmodel/artikel_viewmodel.dart';
import 'package:kel17/viewmodel/login_viewmodel.dart';
import 'package:kel17/viewmodel/pulsa_viewmodel.dart';
import 'package:kel17/viewmodel/regis_viewmodel.dart';
import 'package:kel17/viewmodel/viewmodel.dart';
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
        ),
        ChangeNotifierProvider(
          create: (context) => PulsaViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ArticleViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisViewModel(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Test()),
    );
  }
}
