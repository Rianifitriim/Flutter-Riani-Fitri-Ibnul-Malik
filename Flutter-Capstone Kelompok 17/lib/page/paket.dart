import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Paket extends StatefulWidget {
  const Paket({
    Key? key,
  }) : super(key: key);

  @override
  State<Paket> createState() => _PaketState();
}

class _PaketState extends State<Paket> {
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
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 10) / 7;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Pilih Paket')),
          backgroundColor: Color(0xFF6372F6),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/paket.png'),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: (itemWidth / itemHeight),
                        children: List.generate(iconTypes.length, (index) {
                          return Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 216, 227, 252),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    //                 RaisedButton(
                                    //   onPressed: () {
                                    //     showModalBottomSheet(
                                    //       context: context,
                                    //       builder: (context) => PilihPaket(
                                    //         iconn : iconTypes.length,(index),
                                    //       ),
                                    //     );
                                    //   },
                                    // ),
                                    Center(
                                      child: Icon(
                                        iconTypes[index],
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        })),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
