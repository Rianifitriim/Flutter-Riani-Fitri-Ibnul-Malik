import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Barcode Task'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
            child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                bottom: 20,
                                top: 30,
                              ),
                              child: Text("Alterra Academy")),
                          barCode("Alterra Academy"),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                bottom: 20,
                                top: 30,
                              ),
                              child: Text("Flutter Asik")),
                          barCode("Flutter Asik"),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                bottom: 20,
                                top: 30,
                              ),
                              child: Text("Riani Fitri Ibnul Malik")),
                          barCode("Riani Fitri Ibnul Malik"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )));
  }

  Stack barCode(String data) {
    return Stack(
      alignment: Alignment.center,
      children: [
        BarcodeWidget(
          barcode: Barcode.qrCode(
            errorCorrectLevel: BarcodeQRCorrectionLevel.high,
          ),
          data: data,
          width: 200,
          height: 200,
        ),
      ],
    );
  }
}
