import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data_manager.dart';
import 'add_data.dart';

class EmptyHome extends StatelessWidget {
  const EmptyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Homepage'),
        centerTitle: true,
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
      body: const Center(
        child: Text(
          'Tampilan Kosong',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
