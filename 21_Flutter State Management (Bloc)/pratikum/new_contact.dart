import './cubit/data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './model/data_contact.dart';
import 'cubit/data_state.dart';

class NewContact extends StatefulWidget {
  const NewContact({
    Key? key,
  }) : super(key: key);

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  var formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final numberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    namaController.dispose();
    numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('New Contacts'),
          ),
          body: SafeArea(
            child: Form(
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
                          context.read<DataCubit>().tambahData(submit);
                          Navigator.pop(context);
                        },
                        child: const Text('Submit'),
                        style: ButtonStyle(),
                      )
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
