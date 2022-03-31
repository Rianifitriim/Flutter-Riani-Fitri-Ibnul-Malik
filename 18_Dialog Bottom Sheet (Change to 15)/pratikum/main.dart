// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:soal1/tampilanimg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(
                onPressed: (() {}),
              ),
          '/detail': (context) => TampilanImg(
                image: '',
              ),
        });
  }
}

class HomePage extends StatelessWidget {
  final Function() onPressed;
  HomePage({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  var img = [
    'https://images.unsplash.com/photo-1588768987479-bcebeefb8a5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    'https://images.unsplash.com/photo-1618419313164-fa76b8691bee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNhdCUyMHBvdHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1612812166620-a072f77ec45b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGNhdCUyMHBvdHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Container(
              color: Colors.grey,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'GridView',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
          backgroundColor: Colors.blue,
        ),
        body: GridView.count(
            padding: EdgeInsets.all(16),
            crossAxisCount: 3,
            children: List.generate(img.length, (index) {
              return Container(
                child: Column(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => TampilanImg(
                            image: img[index],
                          ),
                        );
                      },
                      child: Image(
                          height: 75,
                          width: 75,
                          image: NetworkImage(
                            img[index],
                          ),
                          fit: BoxFit.cover),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(10, 10))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: const Text('Kenapa liat liat?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Image.network(
                                          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                                        ),
                                      ),
                                    ],
                                  ));
                        },
                        child: Text('Alert')),
                  ],
                ),
              );
            })));
  }
}
