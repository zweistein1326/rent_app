import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  static const routeName = '/account-screen';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context).user;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Hi ${user.firstName}'),
      ),
      body: Text("HELLO"),
    );
  }
}
