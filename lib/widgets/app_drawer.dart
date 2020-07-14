import 'package:flutter/material.dart';
import 'package:rent_app/screens/account_screen.dart';
import 'package:rent_app/screens/categories_screen.dart';
import '../screens/products_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            elevation: 0,
            title: Text(
              'Hello User!',
            ),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(
              Icons.home,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .pushReplacementNamed(ProductsOverviewScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Account'),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .pushReplacementNamed(AccountScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {},
          ),
          Divider(),
        ],
      ),
    );
  }
}
