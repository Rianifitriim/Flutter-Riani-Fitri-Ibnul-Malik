import 'package:flutter/material.dart';
import 'package:soal1/Helper/DbHelper.dart';
import 'package:soal1/components/genLoginSignupHeader.dart';
import 'package:soal1/components/genTextFormField.dart';
import 'package:soal1/model/UserModel.dart';
import 'package:soal1/screens/LoginForm.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  signUp() async {
    String uid = _conUserId.text;
    String uname = _conUserName.text;
    String email = _conEmail.text;
    String passwd = _conPassword.text;
    String cpasswd = _conCPassword.text;

    if (_formKey.currentState!.validate()) {
      if (passwd != cpasswd) {
        AlertDialog alert = AlertDialog(
          content: Text("pass salah"),
          actions: [
            FlatButton(
                child: Text("OK"),
                onPressed: () => Navigator.of(context).pop()),
          ],
        );
      } else {
        _formKey.currentState?.save();

        UserModel uModel = UserModel(uid, uname, email, passwd);
        await dbHelper.saveData(uModel).then((userData) {
          // alertDialog(context, "Successfully Saved");
          AlertDialog alert = AlertDialog(
            content: Text("pass benar"),
            actions: [
              FlatButton(
                  child: Text("OK"),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          );
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginForm()));
        }).catchError((error) {
          print(error);
          AlertDialog alert = AlertDialog(
            title: Text("Info"),
            content: Text("Data gagal disimpan"),
            actions: [
              FlatButton(
                  child: Text("OK"),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  genLoginSignupHeader('Signup'),
                  getTextFormField(
                      controller: _conUserId,
                      icon: Icons.person,
                      hintName: 'User Name'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conUserName,
                      icon: Icons.person_outline,
                      inputType: TextInputType.name,
                      hintName: 'Full Name'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conEmail,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Email'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: _conPassword,
                    icon: Icons.lock,
                    hintName: 'Password',
                    isObscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: _conCPassword,
                    icon: Icons.lock,
                    hintName: 'Confirm Password',
                    isObscureText: true,
                  ),
                  Container(
                    margin: EdgeInsets.all(30.0),
                    width: double.infinity,
                    child: FlatButton(
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: signUp,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(143, 148, 251, 1),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Does you have account? '),
                        FlatButton(
                          textColor: Color.fromRGBO(143, 148, 251, 1),
                          child: Text('Sign In'),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => LoginForm()),
                                (Route<dynamic> route) => false);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
