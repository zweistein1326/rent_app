import 'package:flutter/material.dart';
import './product_tile.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final cat;
  ProductsGrid(this.cat);
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context).items(cat);
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left:20),
          width: double.infinity,
          child: Text(
            cat.toString().split('.')[1].toUpperCase(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          height: MediaQuery.of(context).size.height * 0.23,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) => ProductTile(products[i]),
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
