import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shop extends StatefulWidget {
  const Shop({
    Key? key,
  }) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  var iconTypes = <IconData>[
    Icons.cake,
    Icons.add_location_sharp,
    Icons.zoom_in_outlined,
    Icons.auto_awesome_motion,
    Icons.call_end_sharp,
    Icons.equalizer_rounded,
    Icons.wifi_lock,
    Icons.mail,
    Icons.cake,
    Icons.add_location_sharp,
    Icons.zoom_in_outlined,
    Icons.auto_awesome_motion,
    Icons.call_end_sharp,
    Icons.equalizer_rounded,
    Icons.wifi_lock,
    Icons.mail,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            children: [
              GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  children: List.generate(iconTypes.length, (index) {
                    return Container(
                        margin: const EdgeInsets.all(3),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 216, 227, 252),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Icon(
                                iconTypes[index],
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ));
                  })),
            ],
          ),
        ),
      ),
    ));
  }
}
