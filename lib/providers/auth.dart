import 'package:flutter/material.dart';

class User {
  final String firstName;
  final String lastName;
  final String contact;
  final String address;

  User({this.address, this.contact, this.firstName, this.lastName});
}

class Users with ChangeNotifier {
  final Map<String, User> _users = {
    'u1': User(
      firstName: 'siddharth',
      lastName: 'Agarwal',
      contact: '987654234',
      address: 'xdfcgvhjknbvcgxdfsrdtfygh',
    )
  };

  User get user {
    return _users['u1'];
  }
}
