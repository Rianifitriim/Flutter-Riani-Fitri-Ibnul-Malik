// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lengkap23/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cubit/data_cubit.dart';
import 'bloc/cubit/theme_cubit.dart';
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: ((context) => DataCubit()),
            ),
            BlocProvider(
              create: ((context) => ThemeCubit()),
            ),
          ],
          child: BlocBuilder<ThemeCubit, bool>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: state ? ThemeData.light() : ThemeData.dark(),
                home: HomeScreen(),
              );
            },
          ),
        ));
  }
}
