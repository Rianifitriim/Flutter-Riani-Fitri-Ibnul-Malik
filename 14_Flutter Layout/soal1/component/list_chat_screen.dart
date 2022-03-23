import 'package:flutter/material.dart';
// import 'package:soal1/models/chat.dart';

class ListChatScreen extends StatefulWidget {
  ListChatScreen({Key? key}) : super(key: key);

  @override
  State<ListChatScreen> createState() => _ListChatScreenState();
}

class _ListChatScreenState extends State<ListChatScreen> {
  var pesan = [
    {
      'nama': 'riani',
      'isiChat': 'asdfghjkl',
      'jam': '13.18',
      'inisial': 'R',
    },
    {
      'nama': 'ani',
      'isiChat': 'asdfghjkl',
      'jam': '13.18',
      'inisial': 'A',
    },
    {
      'nama': 'ria',
      'isiChat': 'asdfghjkl',
      'jam': '13.18',
      'inisial': 'R',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: NavBar(),
        appBar: AppBar(
          title: const Text(
            'JSON Listview in Flutter',
          ),
        ),
        //search bar
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              ListView.builder(
                  itemCount: pesan.length,
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                              child: Text('${pesan[index]['inisial']}')),
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
                                        fontSize: 15, color: Colors.grey))
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  })
            ]),
          ),
        ));
  }
}
