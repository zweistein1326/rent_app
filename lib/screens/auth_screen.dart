import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit() {
    print(_usernameController.text);
    print(_passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              'https://www.washingtonpost.com/resizer/WWLs91LUlbMpRXQMbDcLPXlFUhg=/1484x0/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/AA43TKRJCY7PJGI3Y6PWFEF44I.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Stack(
                children: <Widget>[],
              ),
            ),
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Theme(
                    data: Theme.of(context).copyWith(splashColor: Colors.white),
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username/Email',
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 14),
                      ),
                      color: Colors.white,
                      onPressed: _submit,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
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
                color: Colors.white,
                onPressed: () {
                  //implement sign up
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
