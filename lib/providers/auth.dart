import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './user.dart';
import 'package:rent_app/models/http_exception.dart';

class Auth with ChangeNotifier {
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
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDjz2LVvn3BvRdtmPOF3rGNK0zaP4zSxY0';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(
        seconds: int.parse(
          responseData['expiresIn'],
        ),
      ));
      notifyListeners();
    } catch (e) {
      print('Not found');
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  var _user = User(name: '', address: '', contact: '', id: '');

  Future<void> addUser(User user) async {
    print(user.name);
    const url = "https://rent-app-52a40.firebaseio.com/user-details.json";
    final req = await http.get(url);
    if (json.decode(req.body) == null) {
      final response = await http.post(
        url,
        body: json.encode({
          'name': user.name,
          'contact': user.contact,
          'address': user.address,
        }),
      );
      final newUser = User(
        name: user.name,
        contact: user.contact,
        address: user.address,
        id: json.decode(response.body)['name'],
      );
      _user = newUser;
    }
  }

  User get user {
    return _user;
  }

  Future<void> fetchAndSetUser() async {
    const url = "https://rent-app-52a40.firebaseio.com/user-details.json";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    User _loadedUser = User(name: '', contact: '', address: '', id: null);
    extractedData.forEach((id, userData) {
      _loadedUser = User(
        id: id,
        name: userData['name'],
        contact: userData['contact'],
        address: userData['address'],
      );
    });
    _user = _loadedUser;
    notifyListeners();
    //  _user= User(name: loadedUser.)
  }

  Future<void> updateUser(String id, User user) async {
    var url = "https://rent-app-52a40.firebaseio.com/user-details/$id.json";
    final response = await http.patch(
      url,
      body: json.encode({
        'name': user.name,
        'contact': user.contact,
        'address': user.address,
      }),
    );
  }
}
