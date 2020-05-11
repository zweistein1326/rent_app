import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AccountScreen extends StatelessWidget {
  static const routeName = '/account-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Your Products'),
      ),
      body: Text("HELLO"),
    );
  }
}
