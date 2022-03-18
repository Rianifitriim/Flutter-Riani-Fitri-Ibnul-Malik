import 'package:flutter/material.dart';
import 'NavBar.dart';

class ListChatScreen extends StatefulWidget {
  ListChatScreen({Key? key}) : super(key: key);

  @override
  State<ListChatScreen> createState() => _ListChatScreenState();
}

class _ListChatScreenState extends State<ListChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            'Telegram',
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.search, color: Colors.white), onPressed: null)
          ],
        ),
        //search bar
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              ListView.builder(
                  itemCount: 10,
                  padding: EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv7t4GtTX9MDwzbf67MQFaM6fxiQUZ4FImvg&usqp=CAU',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
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
                                    Text('Suci',
                                        style: TextStyle(fontSize: 17)),
                                    Text('6.34 pm',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 91, 91, 91)))
                                  ],
                                ),
                                Text('You sent a sticker',
                                    style: TextStyle(
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
