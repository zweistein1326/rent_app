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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Name: ${user.firstName} ${user.lastName}',
                style: TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                color: Theme.of(context).primaryColor,
                onPressed: () {},
              ),
            ),
            ListTile(
              title: Text(
                'Phone Number: ${user.contact}',
                style: TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                color: Theme.of(context).primaryColor,
                onPressed: () {},
              ),
            ),
            ListTile(
              title: Text(
                'Address: ${user.address}',
                style: TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                color: Theme.of(context).primaryColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
