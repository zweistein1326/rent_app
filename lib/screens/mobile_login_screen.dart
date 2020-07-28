// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rent_app/providers/auth.dart';
// import '../services/authService.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final formKey = new GlobalKey<FormState>();
//   String phoneNo;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.only(left: 25.0, right: 25.0),
//               child: TextFormField(
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(hintText: 'Enter phone Number'),
//                 onChanged: (val) {
//                   setState(() {
//                     this.phoneNo = val;
//                   });
//                 },
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
//               child: RaisedButton(
//                 child: Center(
//                   child: Text('Login'),
//                 ),
//                 onPressed: () {
//                   Provider.of<Auth>(context).verifyPhone(phoneNo);
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
