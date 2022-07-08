// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:kel17/component/genTextFormField.dart';
// import 'package:kel17/component/util.dart';
// import 'package:kel17/model/register/data_regis.dart';
// import 'package:kel17/viewmodel/viewmodel.dart';
// import 'package:provider/provider.dart';

// class Register extends StatefulWidget {
//   final Function(DataRegis) onCreate;
//   const Register({
//     Key? key,
//     required this.onCreate,
//   }) : super(key: key);

//   @override
//   _RegisterState createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   bool _rememberMe = false;
//   var formKey = GlobalKey<FormState>();
//   final usernameController = TextEditingController();
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   String username = '';
//   String name = '';
//   String email = '';
//   String password = '';

//   @override
//   void initState() {
//     super.initState();
//     usernameController.addListener(() {
//       username = usernameController.text;
//     });
//     nameController.addListener(() {
//       name = nameController.text;
//     });
//     emailController.addListener(() {
//       email = emailController.text;
//     });
//     passwordController.addListener(() {
//       password = passwordController.text;
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     usernameController.dispose();
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }

//   Widget _buildEmailTF(BuildContext context) {
//     return Consumer<ContactViewModel>(builder: (context, model, child) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             'Email',
//             style: kLabelStyle,
//           ),
//           SizedBox(height: 10.0),
//           Container(
//             alignment: Alignment.centerLeft,
//             decoration: kBoxDecorationStyle,
//             height: 50.0,
//             child: TextField(
//               keyboardType: TextInputType.emailAddress,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'OpenSans',
//               ),
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(top: 13.0),
//                 prefixIcon: Icon(
//                   Icons.email,
//                   color: Colors.white,
//                 ),
//                 hintText: 'Enter your Email',
//                 hintStyle: kHintTextStyle,
//               ),
//             ),
//           ),
//         ],
//       );
//     });
//   }

//   Widget _buildPasswordTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Password',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 50.0,
//           child: TextField(
//             obscureText: true,
//             style: TextStyle(
//               color: Colors.black,
//               fontFamily: 'OpenSans',
//             ),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 13.0),
//               prefixIcon: Icon(
//                 Icons.lock,
//                 color: Colors.black,
//               ),
//               hintText: 'Enter your Password',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildForgotPasswordBtn() {
//     return Container(
//       alignment: Alignment.centerRight,
//       child: FlatButton(
//         onPressed: () => print('Forgot Password Button Pressed'),
//         padding: EdgeInsets.only(right: 0.0),
//         child: Text(
//           'Forgot Password?',
//           style: kLabelStyle,
//         ),
//       ),
//     );
//   }

//   Widget _buildLoginBtn() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 25.0),
//       width: double.infinity,
//       child: RaisedButton(
//         elevation: 5.0,
//         onPressed: () => print('Login Button Pressed'),
//         padding: EdgeInsets.all(15.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         color: Color(0xFF6372F6),
//         child: Text(
//           'Login',
//           style: TextStyle(
//             color: Colors.black,
//             letterSpacing: 1.5,
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'OpenSans',
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSocialBtn(Function onTap, AssetImage logo) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         height: 360.0,
//         width: 360.0,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           image: DecorationImage(
//             image: logo,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSignupBtn() {
//     return GestureDetector(
//       onTap: () => print('Sign Up Button Pressed'),
//       child: RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: 'Don\'t have an Account? ',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             TextSpan(
//               text: 'Sign Up',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle.light,
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context)),
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 child: SingleChildScrollView(
//                   physics: AlwaysScrollableScrollPhysics(),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 20.0,
//                     vertical: 50.0,
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       Text(
//                         'Welcome back,',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'OpenSans',
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 30.0),
//                       getTextFormField(
//                           controller: usernameController,
//                           hintName: "masukkan username anda"),
//                       SizedBox(
//                         height: 30.0,
//                       ),
//                       getTextFormField(
//                           controller: nameController,
//                           hintName: "masukkan name anda"),
//                       SizedBox(
//                         height: 30.0,
//                       ),
//                       getTextFormField(
//                           controller: emailController,
//                           hintName: "masukkan email anda"),
//                       SizedBox(
//                         height: 30.0,
//                       ),
//                       getTextFormField(
//                           controller: passwordController,
//                           hintName: "masukkan kata sandi anda"),
//                       _buildPasswordTF(),
//                       _buildForgotPasswordBtn(),
//                       _buildLoginBtn(),
//                       _buildSignupBtn(),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
