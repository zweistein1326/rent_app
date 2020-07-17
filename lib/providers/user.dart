import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class User with ChangeNotifier {
  final String name;
  final String contact;
  final String address;

  User({
    @required this.name,
    @required this.contact,
    @required this.address,
  });
}
