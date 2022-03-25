import 'package:flutter/material.dart';

class TampilanImg extends StatelessWidget {
  final String image;
  const TampilanImg({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assets'),
      ),
      body: Image.network(
        image,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
