import 'package:flutter/material.dart';
import 'package:rent_app/widgets/product_tile.dart';
import '../providers/product.dart';

class SearchItem extends StatelessWidget {
  Product product;
  SearchItem(this.product);
  @override
  Widget build(BuildContext context) {
    return ProductTile(product);
  }
}
