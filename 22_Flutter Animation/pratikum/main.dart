import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal1/model/homescreen.dart';
import 'package:soal1/new_contact.dart';
import 'cubit/data_cubit.dart';
import 'cubit/theme_cubit.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
            title: 'Flutter BLOC',
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
