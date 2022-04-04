import 'package:flutter/material.dart';

class newContact extends StatefulWidget {
  newContact({Key? key}) : super(key: key);

  @override
  State<newContact> createState() => _newContactState();
}

class _newContactState extends State<newContact> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 186, 209),
            appBar: AppBar(
              title: Text('New Contacts'),
              backgroundColor: Colors.pinkAccent,
            ),
            body: Form(
              key: formKey,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              decoration: new InputDecoration(
                                hintText: "masukan nama lengkap anda",
                                labelText: "Nama Lengkap",
                                icon: Icon(Icons.people),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          hintText: "masukan nomor telepon anda",
                          labelText: "No_hp",
                          icon: Icon(Icons.contact_phone),
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Submit'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pinkAccent),
                        ),
                      )
                    ],
                  )),
            )));
  }
}
