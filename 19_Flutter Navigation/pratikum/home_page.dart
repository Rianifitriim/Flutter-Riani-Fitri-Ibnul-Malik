import 'package:flutter/material.dart';
import 'package:soal1/new_contact.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pesan = [
      {
        'nama': 'Fiani',
        'isiChat': '+6281398503184',
        'jam': '13.18',
        'inisial': 'F',
      },
      {
        'nama': 'ani',
        'isiChat': '+6285272523759',
        'jam': '13.18',
        'inisial': 'A',
      },
      {
        'nama': 'ria',
        'isiChat': '+6285272523759',
        'jam': '13.18',
        'inisial': 'R',
      },
      {
        'nama': 'riri',
        'isiChat': '+6285272523759',
        'jam': '15.10',
        'inisial': 'R',
      }
    ];
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 245, 218, 227),
          appBar: AppBar(
            title: Text('Contacts'),
            backgroundColor: Colors.purpleAccent.shade400,
          ),
          body: Container(
            margin: EdgeInsets.all(10),
            child: Column(children: [
              ListView.builder(
                  itemCount: pesan.length,
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Text(
                              '${pesan[index]['inisial']}',
                              style: TextStyle(
                                  color: Colors.purpleAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            radius: 25,
                            backgroundColor: Color.fromARGB(255, 236, 187, 245),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${pesan[index]['nama']}',
                                        style: const TextStyle(fontSize: 17)),
                                    Text('${pesan[index]['jam']}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 91, 91, 91)))
                                  ],
                                ),
                                Text('${pesan[index]['isiChat']}',
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.grey)),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  })
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purpleAccent.shade400,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => newContact(),
                ),
              );
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
