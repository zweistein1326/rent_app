import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Stack(
              children: <Widget>[],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username/Email',
                  ),
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                RaisedButton(
                  child: Text('Login'),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    //implement login
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  padding: EdgeInsets.all(10),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          RaisedButton(
              padding: EdgeInsets.all(20),
              child: Text(
                'Don\'t have an account? Signup instead',
                style: TextStyle(fontSize: 14),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                //implement sign up
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
        ],
      ),
    );
  }
}
