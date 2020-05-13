import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({products});
  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black26)),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Search Product',
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
        ),
        onChanged: (input) {},
      ),
    );
  }
}
