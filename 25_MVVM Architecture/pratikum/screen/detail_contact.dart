import 'package:flutter/material.dart';
import 'package:lengkap25/model/data_contact.dart';
import 'package:provider/provider.dart';

import 'contact/contact_viewmodel.dart';

class DetailContact extends StatefulWidget {
  final DataContact dataContact;
  DetailContact({Key? key, required this.dataContact}) : super(key: key);
  @override
  State<DetailContact> createState() => _DetailContactState();
}

class _DetailContactState extends State<DetailContact> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context, listen: false)
          .ambilDetailData(widget.dataContact.id);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 245, 218, 227),
            appBar: AppBar(
              title: Text('Contacts'),
              backgroundColor: Colors.purpleAccent.shade400,
            ),
            body: Center(
              child:
                  Consumer<ContactViewModel>(builder: (context, value, child) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(value.detailContact.name,
                          style: TextStyle(fontSize: 25)),
                      Text(value.detailContact.phone,
                          style: TextStyle(fontSize: 25)),
                    ],
                  ),
                );
              }),
            )));
  }
}
