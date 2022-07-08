import 'dart:math' as math;

import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/component/util.dart';
import 'package:kel17/page/b.dart';

class QnA extends StatefulWidget {
  @override
  _QnAState createState() => _QnAState();
}

class _QnAState extends State<QnA> {
  bool? _expanded2;
  final _key3 = GlobalKey<ExpansionWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Support')),
        backgroundColor: Color(0xFF6372F6),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    'Pertanyaan yang paling populer, temukan jawabanmu disini.',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              card1(),
              card2(),
              card3(),
              card4(),
              card5(),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Text(
                  'Masih tidak menemukan pertanyaanmu?',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    'Silahkan tulis keresahan kamu, jangan takut untuk bertanya. seperti pepatah malu bertanya sesat dijalan, pertanyaan kamu akan kami balas, namun mohon ditunggu ya.',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    'Jangan khawatir, kami akan segera membantu keresahanmu dan keresahanmu akan hilang dalam sekejap.',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              buildProfile(),
              buildDesc(),
              Buildkirim()
            ],
          ),
        ),
      ),
    );
  }
}

class card1 extends StatelessWidget {
  const card1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF6372F6),
      child: ExpansionWidget(
          initiallyExpanded: true,
          titleBuilder:
              (double animationValue, _, bool isExpaned, toogleFunction) {
            return InkWell(
                onTap: () => toogleFunction(animated: true),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Bagaimana cara mengubah kata sandi',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        child: Icon(
                          Icons.arrow_right,
                          size: 40,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ));
          },
          content: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              'Halaman profile - edit profile - ubah kata sandi - konfirmasi kata sandi - tekan tombol selesai',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}

class card2 extends StatelessWidget {
  const card2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF4DA9FF),
      child: ExpansionWidget(
          initiallyExpanded: true,
          titleBuilder:
              (double animationValue, _, bool isExpaned, toogleFunction) {
            return InkWell(
                onTap: () => toogleFunction(animated: true),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Bagaimana cara mengubah kata sandi',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        child: Icon(
                          Icons.arrow_right,
                          size: 40,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ));
          },
          content: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              'Halaman profile - edit profile - ubah kata sandi - konfirmasi kata sandi - tekan tombol selesai',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}

class card3 extends StatelessWidget {
  const card3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF80D0C7),
      child: ExpansionWidget(
          initiallyExpanded: true,
          titleBuilder:
              (double animationValue, _, bool isExpaned, toogleFunction) {
            return InkWell(
                onTap: () => toogleFunction(animated: true),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Bagaimana cara mengubah kata sandi',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        child: Icon(
                          Icons.arrow_right,
                          size: 40,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ));
          },
          content: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              'Halaman profile - edit profile - ubah kata sandi - konfirmasi kata sandi - tekan tombol selesai',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}

class card4 extends StatelessWidget {
  const card4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF91B3FA),
      child: ExpansionWidget(
          initiallyExpanded: true,
          titleBuilder:
              (double animationValue, _, bool isExpaned, toogleFunction) {
            return InkWell(
                onTap: () => toogleFunction(animated: true),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Bagaimana cara mengubah kata sandi',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        child: Icon(
                          Icons.arrow_right,
                          size: 40,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ));
          },
          content: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              'Halaman profile - edit profile - ubah kata sandi - konfirmasi kata sandi - tekan tombol selesai',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}

class card5 extends StatelessWidget {
  const card5({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFE766A),
      child: ExpansionWidget(
          initiallyExpanded: true,
          titleBuilder:
              (double animationValue, _, bool isExpaned, toogleFunction) {
            return InkWell(
                onTap: () => toogleFunction(animated: true),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Bagaimana cara mengubah kata sandi',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        child: Icon(
                          Icons.arrow_right,
                          size: 40,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ));
          },
          content: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              'Halaman profile - edit profile - ubah kata sandi - konfirmasi kata sandi - tekan tombol selesai',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}

Widget buildProfile() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Profil Kamu :',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 92, 92),
            fontFamily: 'poppins',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            hintText: 'Namaku@gmail.com',
            hintStyle: kHintTextStyle,
            prefixIcon: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildDesc() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Profil Kamu :',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        margin: EdgeInsets.all(10),
        height: 150.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Color.fromARGB(255, 105, 92, 92),
            fontFamily: 'poppins',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            hintText: 'Namaku@gmail.com',
            hintStyle: kHintTextStyle,
            prefixIcon: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget Buildkirim() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    width: 180,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: () => print('Login Button Pressed'),
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Color(0xFF6372F6),
      child: Text(
        'Kirim',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
