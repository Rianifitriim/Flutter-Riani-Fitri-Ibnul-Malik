// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, camel_case_types

import 'package:flutter/cupertino.dart';

void main() {
  runApp(CupertinoApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var p = " ";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Edit",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: CupertinoColors.activeBlue),
            ),
          ],
        ),
        middle: Text("Chats",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
        trailing: Icon(
          CupertinoIcons.arrow_down_left_square,
        ),
      ),
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                label: "Chats",
                icon: Icon(CupertinoIcons.chat_bubble_2_fill),
              ),
              BottomNavigationBarItem(
                label: "Calls",
                icon: Icon(CupertinoIcons.phone),
              ),
              BottomNavigationBarItem(
                label: "People",
                icon: Icon(CupertinoIcons.person_alt_circle),
              ),
              BottomNavigationBarItem(
                label: "Settings",
                icon: Icon(CupertinoIcons.settings_solid),
              )
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(
              defaultTitle: "Chats",
              builder: (context) => chatlist(),
            );
          }),
    );
  }
}

class chatlist extends StatelessWidget {
  const chatlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        CupertinoSearchTextField(
          prefixInsets: EdgeInsets.only(left: 170),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All chats",
                style:
                    TextStyle(color: CupertinoColors.activeBlue, fontSize: 18),
              ),
              Row(
                children: [
                  Text(
                    "Work",
                    style: TextStyle(
                        color: CupertinoColors.systemGrey, fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Unread",
                    style: TextStyle(
                        color: CupertinoColors.systemGrey, fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Personal",
                    style: TextStyle(
                        color: CupertinoColors.systemGrey, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv7t4GtTX9MDwzbf67MQFaM6fxiQUZ4FImvg&usqp=CAU'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Suci",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Ci besok pergi kkn jamber?",
                            style: TextStyle(
                                color: CupertinoColors.systemGrey2,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: Text("13.40"))
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
