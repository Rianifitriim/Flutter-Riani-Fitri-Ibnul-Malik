import 'package:flutter/material.dart';
import 'package:soal1/homepage.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isBig = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homescreen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isBig = !isBig;
                });
              },
              child: const Text('animasi'),
            ),
            AnimatedContainer(
              width: isBig ? 200 : 100,
              height: isBig ? 200 : 100,
              duration: const Duration(milliseconds: 300),
              child: Image.network(
                'https://images.unsplash.com/photo-1511044568932-338cba0ad803?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Homepage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
