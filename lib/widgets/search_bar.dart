import 'package:flutter/material.dart';
import 'package:rent_app/providers/products.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: TextField(
        controller: _textController,
        decoration: InputDecoration(
          labelText: 'Search',
          contentPadding: EdgeInsets.all(10),
        ),
        onChanged: (input) {
          Provider.of<Products>(context).searchByItem(input);
        },
      ),
    );
  }
}
