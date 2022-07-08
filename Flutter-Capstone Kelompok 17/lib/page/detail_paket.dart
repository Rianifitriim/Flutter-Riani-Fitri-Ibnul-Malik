import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_plus/dropdown_plus.dart';

import '../component/util.dart';

class DetailPaket extends StatefulWidget {
  const DetailPaket({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPaket> createState() => _DetailPaketState();
}

class _DetailPaketState extends State<DetailPaket> {
  var iconTypes = <IconData>[
    Icons.cake,
    Icons.add_location_sharp,
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 10) / 7;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Detail Redeem Paket')),
          backgroundColor: Color(0xFF6372F6),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 20),
                    child: Row(
                      children: [
                        Text(
                          'Transaksi Terakhir',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'Nama Provider',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Example(),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'No hp',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(15), child: _buildEmailTF()),
                ],
              ),
            ),
          ),
        ));
  }
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final List<Map<String, dynamic>> _roles = [
    {
      "name": "Super Admin",
      "desc": "Having full access rights",
      "role": 1,
    },
    {
      "name": "Admin",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "Manager",
      "desc": "Having Magenent access rights of a Organization",
      "role": 3
    },
    {
      "name": "Technician",
      "desc": "Having Technician Support access rights",
      "role": 4
    },
    {
      "name": "Customer Support",
      "desc": "Having Customer Support access rights",
      "role": 5
    },
    {"name": "User", "desc": "Having End User access rights", "role": 6},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          DropdownFormField<Map<String, dynamic>>(
            onEmptyActionPressed: () async {},
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.arrow_drop_down),
                labelText: "Access"),
            onSaved: (dynamic str) {},
            onChanged: (dynamic str) {},
            validator: (dynamic str) {},
            displayItemFn: (dynamic item) => Text(
              (item ?? {})['name'] ?? '',
              style: TextStyle(fontSize: 16),
            ),
            findFn: (dynamic str) async => _roles,
            selectedFn: (dynamic item1, dynamic item2) {
              if (item1 != null && item2 != null) {
                return item1['name'] == item2['name'];
              }
              return false;
            },
            filterFn: (dynamic item, str) =>
                item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
            dropdownItemFn: (dynamic item, int position, bool focused,
                    bool selected, Function() onTap) =>
                ListTile(
              title: Text(item['name']),
              subtitle: Text(
                item['desc'] ?? '',
              ),
              tileColor:
                  focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildEmailTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 92, 92),
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            hintText: 'Enter your Email',
            hintStyle: kHintTextStyle,
            prefixIcon: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}
