import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return _token;
  }

  String get userId {
    return _userId;
  }

  Future<void> setUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    _userId = user.uid;
    // _userId = user.uid;
    await user.getIdToken().then((user) {
      _token = user.token;
      _expiryDate = user.authTime.add(Duration(days: 1));
      print(_expiryDate);
    }).catchError((error) {
      print(error);
    });
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'token': _token,
      'userId': _userId,
      'expiryDate': _expiryDate.toIso8601String()
    });
    prefs.setString('userData', userData);
  }

  Future createUserWithPhone(String phone, BuildContext context) async {
    _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 30),
        verificationCompleted: (AuthCredential authCredential) {
          _firebaseAuth
              .signInWithCredential(authCredential)
              .then((AuthResult result) {
            setUser();
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/products-screen');
          });
        },
        verificationFailed: (AuthException exception) {
          return "error";
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          final _codeController = TextEditingController();
          showDialog(
              barrierDismissible: false,
              context: (context),
              builder: (ctx) => AlertDialog(
                    title: Text('OTP'),
                    content: TextField(
                      keyboardType: TextInputType.number,
                      controller: _codeController,
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Submit'),
                        textColor: Colors.white,
                        color: Colors.green,
                        onPressed: () {
                          var _credential = PhoneAuthProvider.getCredential(
                              verificationId: verificationId,
                              smsCode: _codeController.text.trim());
                          _firebaseAuth
                              .signInWithCredential(_credential)
                              .then((AuthResult result) {
                            setUser();
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed('/products-screen');
                          }).catchError((e) {
                            return "error";
                          });
                        },
                      )
                    ],
                  ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
        });
  }

  Future<void> tryAutoLogin() async {
    print('trying autologin');
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      print('false');
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);
    print(expiryDate);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate;
    print(_token);
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  // Future<void> _authenticate(
  //     String email, String password, String urlSegment) async {
  //   final url =
  //       'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDjz2LVvn3BvRdtmPOF3rGNK0zaP4zSxY0';
  //   try {
  //     final response = await http.post(
  //       url,
  //       body: json.encode(
  //         {
  //           'email': email,
  //           'password': password,
  //           'returnSecureToken': true,
  //         },
  //       ),
  //     );
  //     final responseData = json.decode(response.body);
  //     if (responseData['error'] != null) {
  //       throw HttpException(responseData['error']['message']);
  //     }
  //     _token = responseData['idToken'];
  //     _userId = responseData['localId'];
  //     _expiryDate = DateTime.now().add(Duration(
  //       seconds: int.parse(
  //         responseData['expiresIn'],
  //       ),
  //     ));
  //     _autoLogout();
  //     notifyListeners();
  //     final prefs = await SharedPreferences.getInstance();
  //     final userData = json.encode({
  //       'token': _token,
  //       'userId': _userId,
  //       'expiryDate': _expiryDate.toIso8601String()
  //     });
  //     prefs.setString('userData', userData);
  //   } catch (error) {
  //     throw error;
  //   }
  // }

  // Future<void> signup(String email, String password) async {
  //   return _authenticate(email, password, 'signUp');
  // }

  // Future<void> login(String email, String password) async {
  //   return _authenticate(email, password, 'signInWithPassword');
  // }

}
