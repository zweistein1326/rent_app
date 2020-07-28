import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/providers/auth.dart';
import 'package:rent_app/screens/account_screen.dart';
import 'package:rent_app/screens/orders_screen.dart';
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
            title: Text('My Orders'),
            leading: Icon(
              Icons.payment,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
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
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              showDialog(
                  context: (context),
                  child: AlertDialog(
                    title: Text('Logout'),
                    content: Text('Are you sure'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Yes'),
                        onPressed: () {
                          Navigator.of(context).pop();

                          Navigator.of(context).pushReplacementNamed('/');
                          // Provider.of<Auth>(context, listen: false).logout();
                        },
                      )
                    ],
                  ));
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
