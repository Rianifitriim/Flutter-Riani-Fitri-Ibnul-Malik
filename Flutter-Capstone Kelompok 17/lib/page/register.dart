import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kel17/component/genTextFormField.dart';
import 'package:kel17/model/register/data_regis.dart';
import 'package:kel17/page/loginn.dart';
import 'package:kel17/viewmodel/regis_viewmodel.dart';
import 'package:kel17/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  // final Function(DataRegis) onCreate;
  const Register({
    Key? key,
    // required this.onCreate,
  }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  String nama = '';
  String username = '';
  String email = '';
  String password = '';
  String address = '';
  String phone = '';

  @override
  void initState() {
    super.initState();
    namaController.addListener(() {
      nama = namaController.text;
    });
    usernameController.addListener(() {
      username = usernameController.text;
    });
    emailController.addListener(() {
      email = emailController.text;
    });
    passwordController.addListener(() {
      password = passwordController.text;
    });
    addressController.addListener(() {
      address = addressController.text;
    });
    phoneController.addListener(() {
      phone = phoneController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    namaController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<RegisViewModel>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(bottom: 8, left: 5),
                      child: Text(
                        'Full Name',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: getTextFormField(
                        controller: namaController,
                        hintName: 'Name',
                      ),
                    ),
                  ],
                ),
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
                    'Email',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: getTextFormField(
                    controller: emailController,
                    hintName: 'Email',
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
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(bottom: 8, left: 5),
                  child: Text(
                    'Address',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: getTextFormField(
                    controller: addressController,
                    hintName: 'Address',
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(bottom: 8, left: 5),
                  child: Text(
                    'Phone',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: getTextFormField(
                    controller: phoneController,
                    hintName: 'Phone',
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final submit = DataRegis(
                        email: emailController.text,
                        name: namaController.text,
                        password: passwordController.text,
                        username: usernameController.text,
                        address: addressController.text,
                        phone: usernameController.text);
                    final regis = await getProvider.regis(submit);
                    print(regis);
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Loginn()));
                  },
                  child: const Text('Submit'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF6372F6)),
                  ),
                )
              ]

                  // },

                  //       child: Container(
                  //           width: double.infinity,
                  //           child: Center(child: Text("Daftar"))),
                  //       style: ButtonStyle(
                  //         backgroundColor: MaterialStateProperty.all(
                  //           Color(0xFF6372F6),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  )),
        ),
      ),
    ));
  }
}
