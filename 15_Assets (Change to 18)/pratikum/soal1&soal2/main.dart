import 'package:flutter/material.dart';
import 'package:soal1/tampilan_img.dart';

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
          '/': (context) => Homepage(),
          '/detail': (context) => TampilanImg(
                image: '',
              ),
        });
  }
}

class Homepage extends StatefulWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(img.length, (index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TampilanImg(
                              image: img[index],
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(50),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          img[index],
                        ),
                      ),
                    ),
                  );
                })),
          ),
        ));
  }
}
