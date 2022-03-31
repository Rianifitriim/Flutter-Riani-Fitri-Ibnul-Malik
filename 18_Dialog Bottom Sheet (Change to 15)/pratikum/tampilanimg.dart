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
      body: Center(
        child: Image.network(
          image,
          width: 300,
          height: double.infinity,
          // fit: BoxFit.fill,
        ),
      ),
    );
  }
}
