import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User with ChangeNotifier {
  final String name;
  final String contact;
  final String address;
  final String id;

  User({
    @required this.id,
    @required this.name,
    @required this.contact,
    @required this.address,
  });
}
