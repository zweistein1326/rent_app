// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../screens/mobile_login_screen.dart';
// import '../screens/products_overview_screen.dart';

// class AuthService {
//   //Handles Auth
//   handleAuth() {
//     print('handling AUth');
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.onAuthStateChanged,
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.hasData) {
//           return ProductsOverviewScreen();
//         } else {
//           return LoginPage();
//         }
//       },
//     );
//   }

//   //Sign Out

//   signOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   signIn(AuthCredential authCredential) {
//     print(authCredential.providerId);
//     FirebaseAuth.instance.signInWithCredential(authCredential);
//   }
// }
