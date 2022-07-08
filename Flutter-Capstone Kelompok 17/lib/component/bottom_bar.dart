import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:kel17/page/Homepage.dart';
import 'package:kel17/page/profile.dart';
import 'package:kel17/page/redeem.dart';
import 'package:kel17/page/tab_bar.dart';
import 'package:kel17/page/transaksi.dart';

class ButtomBar extends StatefulWidget {
  @override
  _ButtomBarState createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Container(child: Test()),
          Container(child: Transaksi()),
          Container(child: Tabb()),
          Container(child: Tukar()),
          Container(child: Profile()),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        showActiveBackgroundColor: true,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Color.fromRGBO(143, 148, 251, 1),
          ),
          BottomBarItem(
            icon: Icon(Icons.money_sharp),
            title: Text('History'),
            activeColor: Color.fromRGBO(143, 148, 251, 1),
          ),
          BottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Shop'),
            activeColor: Color.fromRGBO(143, 148, 251, 1),
          ),
          BottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Redeem'),
            activeColor: Color.fromRGBO(143, 148, 251, 1),
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: Color.fromRGBO(143, 148, 251, 1),
          ),
        ],
      ),
    );
  }
}
