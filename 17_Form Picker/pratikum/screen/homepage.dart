import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/data_form.dart';
import '../model/data_manager.dart';
import 'add_data.dart';

class HomePage extends StatelessWidget {
  final DataManager dataManager;
  const HomePage({
    Key? key,
    required this.dataManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataPost = dataManager.dataForm;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Post'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
        actions: [
          IconButton(
            onPressed: () {
              final manager = Provider.of<DataManager>(context, listen: false);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddData(onCreate: (contact) {
                    manager.addData(contact);
                    Navigator.pop(context);
                  }),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final data = dataPost[index];
            return Preview(key: Key(data.id!), dataForm: data);
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 1,
          ),
          itemCount: dataPost.length,
        ),
      ),
    );
  }
}

class Preview extends StatelessWidget {
  final DataForm dataForm;
  const Preview({
    Key? key,
    required this.dataForm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.blueGrey,
          child: Image.file(
            File(dataForm.file!),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Published ' +
                    DateFormat('dd-MM-yyyy').format(
                      dataForm.createdAt!,
                    ),
              ),
              Row(
                children: [
                  const Text('Color : '),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: dataForm.color!,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Text(
            dataForm.caption!,
            maxLines: null,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
