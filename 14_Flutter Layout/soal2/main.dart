import 'package:flutter/material.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
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
  var iconTypes = <IconData>[
    Icons.cake,
    Icons.add_location_sharp,
    Icons.zoom_in_outlined,
    Icons.auto_awesome_motion,
    Icons.call_end_sharp,
    Icons.equalizer_rounded,
    Icons.wifi_lock,
    Icons.mail,
    Icons.g_translate,
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
                crossAxisCount: 4,
                children: List.generate(iconTypes.length, (index) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 72, 189, 243),
                      child: Icon(
                        iconTypes[index],
                        color: Colors.white,
                      ),
                    ),
                  );
                })),
          ),
        ));
  }
}
