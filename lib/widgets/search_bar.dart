import 'package:flutter/material.dart';
import 'package:rent_app/providers/products.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/widgets/search_item.dart';
import '../providers/product.dart';

class SearchBar extends StatelessWidget {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Products>(context).items;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: TextField(
            enableSuggestions: true,
            controller: _textController,
            decoration: InputDecoration(
              labelText: 'Search',
              contentPadding: EdgeInsets.all(10),
            ),
            onChanged: (input) {
              Provider.of<Products>(context).searchByItem(input);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Popular Items',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (ctx, index) => SearchItem(products[index])),
        ),
      ],
    );
  }
}
