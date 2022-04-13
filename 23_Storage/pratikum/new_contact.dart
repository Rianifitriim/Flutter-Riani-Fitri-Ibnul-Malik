import 'package:flutter/material.dart';
import './model/data_contact.dart';

class newContact extends StatefulWidget {
  final Function(DataContact) onCreate;
  const newContact({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  State<newContact> createState() => _newContactState();
}

class _newContactState extends State<newContact> {
  var formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final numberController = TextEditingController();
  String nama = '';
  String number = '';

  @override
  void initState() {
    super.initState();
    namaController.addListener(() {
      nama = namaController.text;
    });
    numberController.addListener(() {
      number = numberController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    namaController.dispose();
    numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 236, 187, 245),
            appBar: AppBar(
              title: const Text('New Contacts'),
              backgroundColor: Colors.purpleAccent.shade400,
            ),
            body: Form(
              key: formKey,
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              controller: namaController,
                              decoration: InputDecoration(
                                hintText: "masukan nama lengkap anda",
                                labelText: "Nama Lengkap",
                                icon: const Icon(Icons.people),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: numberController,
                        decoration: InputDecoration(
                          hintText: "masukan nomor telepon anda",
                          labelText: "No_hp",
                          icon: const Icon(Icons.contact_phone),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final submit = DataContact(
                            name: namaController.text,
                            number: numberController.text,
                          );
                          widget.onCreate(submit);
                        },
                        child: const Text('Submit'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.purpleAccent.shade400),
                        ),
                      )
                    ],
                  )),
            )));
  }
}
