import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/component/bottom_bar.dart';
import 'package:kel17/component/genTextFormField.dart';
import 'package:kel17/model/login/data_login.dart';
import 'package:kel17/model/register/data_regis.dart';
import 'package:kel17/page/Homepage.dart';
import 'package:kel17/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

class Loginn extends StatefulWidget {
  // final Function(DataRegis) onCreate;
  const Loginn({
    Key? key,
    // required this.onCreate,
  }) : super(key: key);

  @override
  State<Loginn> createState() => _LoginnState();
}

class _LoginnState extends State<Loginn> {
  var formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    usernameController.addListener(() {
      username = usernameController.text;
    });
    passwordController.addListener(() {
      password = passwordController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<LoginViewModel>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Welcome back,',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildSocialBtnRow(),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(bottom: 8, left: 5),
                    child: Text(
                      'Username',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: getTextFormField(
                      controller: usernameController,
                      hintName: 'Username',
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(bottom: 8, left: 5),
                    child: Text(
                      'Password',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: getTextFormField(
                      controller: passwordController,
                      hintName: 'Password',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final submit = DataLogin(
                          password: passwordController.text,
                          username: usernameController.text);
                      await getProvider.login(submit);
                      if (getProvider.loginData != null &&
                          getProvider.loginData!.message == "Login berhasil!") {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    ButtomBar()));
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Username atau password anda salah'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text('Submit'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF6372F6)),
                    ),
                  ),
                ],
              )),
        ),
      ),
    ));
  }
}

Widget _buildSocialBtnRow() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildSocialBtn(
          () => print(''),
          AssetImage(
            'assets/4.png',
          ),
        ),
      ],
    ),
  );
}

Widget _buildSocialBtn(Function onTap, AssetImage logo) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 360.0,
      width: 360.0,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: logo,
        ),
      ),
    ),
  );
}
