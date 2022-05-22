import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class genLoginSignupHeader extends StatelessWidget {
  String headerName;

  genLoginSignupHeader(this.headerName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 50.0),
          Text(
            headerName,
            style: GoogleFonts.poppins(
                color: Color.fromRGBO(143, 148, 251, 1),
                fontWeight: FontWeight.w500,
                fontSize: 25),
          ),
          SizedBox(height: 10.0),
          Image.asset(
            "assets/login.png",
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
