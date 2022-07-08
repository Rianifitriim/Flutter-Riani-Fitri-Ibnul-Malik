import 'package:flutter/material.dart';
import 'package:kel17/page/onboarding_page.dart';

class Success extends StatefulWidget {
  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Container(
      width: double.maxFinite,
      height: 450.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage("assets/sukses2.png"),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF6372F6),
        body: Stack(
          children: [
            Positioned(
                left: 350,
                height: 200,
                width: 200,
                child: Image.asset("assets/7.png")),
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.maxFinite,
                  height: 450.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage("assets/sukses1.png"),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                top: 520,
                left: 250,
                height: 200,
                width: 200,
                child: Image.asset("assets/6.png")),
          ],
        ),
      ),
    );
  }
}
