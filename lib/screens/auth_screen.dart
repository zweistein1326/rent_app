import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Username/Email'),
          ),
          Center(
            child: Text('hello'),
          )
        ],
      ),
    );
  }
}
