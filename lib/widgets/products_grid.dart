import 'package:flutter/material.dart';
import './product_tile.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context).items;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
          ),
          height: MediaQuery.of(context).size.height * 0.23,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) => ProductTile(products[i]),
            itemCount: products.length,
          ),
        ),
        ListTile(
          title: Text(
            'Household',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
          ),
          height: MediaQuery.of(context).size.height * 0.23,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) => ProductTile(products[i]),
            itemCount: products.length,
          ),
        ),
        ListTile(
          title: Text('Add products by categories on this screen'),
        )
      ],
    );
  }
}
