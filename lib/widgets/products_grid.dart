import 'package:flutter/material.dart';
import './product_tile.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context).items;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      height: MediaQuery.of(context).size.height * 0.55,
      child: ListView.builder(
        itemBuilder: (ctx, i) => ProductTile(products[i]),
        itemCount: products.length,
      ),
    );
  }
}
