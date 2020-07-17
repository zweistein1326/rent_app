import 'package:flutter/material.dart';
import 'package:rent_app/providers/orders.dart';
import '../widgets/app_drawer.dart';
import '../providers/user.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class AccountScreen extends StatelessWidget {
  static const routeName = '/account-screen';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Orders>(context).user;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Hi ${user.name}'),
      ),
      body: AccountBlock(),
    );
  }
}

class AccountBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<Orders>(context).user;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Name: ${user.name}',
              style: TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed('edit-details');
              },
            ),
          ),
          ListTile(
            title: Text(
              'Phone Number: ${user.contact}',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: Text(
              'Address: ${user.address}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
