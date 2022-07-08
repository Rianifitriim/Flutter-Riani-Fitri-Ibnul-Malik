import 'package:flutter/material.dart';

import 'comHelper.dart';

class getTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  bool isObscureText;
  TextInputType inputType;
  bool isEnable;

  getTextFormField(
      {required this.controller,
      required this.hintName,
      this.isObscureText = false,
      this.inputType = TextInputType.text,
      this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        enabled: isEnable,
        keyboardType: inputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintName';
          }
          if (hintName == "Email" && !validateEmail(value)) {
            return 'Please Enter Valid Email';
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color(0xFF6372F6)),
          ),
          hintText: hintName,
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
