import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileLoginScreen extends StatefulWidget {
  @override
  _MobileLoginScreenState createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 40),
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();
        AuthResult result = await _auth.signInWithCredential(credential);
        FirebaseUser user = result.user;
        if (user != null) {
          Navigator.of(context).popAndPushNamed('/products-screen');
        } else {
          print('Error');
        }
      },
      verificationFailed: (AuthException exception) {
        print(exception);
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx) => AlertDialog(
                  title: Text("OTP"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Confirm'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () async {
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId,
                                smsCode: _codeController.text.trim());
                        AuthResult result =
                            await _auth.signInWithCredential(credential);
                        FirebaseUser user = result.user;
                        if (user != null) {
                          Navigator.of(context)
                              .popAndPushNamed('/products-screen');
                        } else {
                          print('Error');
                        }
                      },
                    )
                  ],
                ));
      },
      codeAutoRetrievalTimeout: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 36,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Mobile Number'),
                controller: _phoneController,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: FlatButton(
                  child: Text('Login'),
                  onPressed: () {
                    final phone = _phoneController.text.trim();
                    loginUser(phone, context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
