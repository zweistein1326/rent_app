import 'package:flutter/material.dart';
import 'package:rent_app/widgets/product_tile.dart';
import '../providers/product.dart';

class SearchItem extends StatelessWidget {
  final Product product;
  SearchItem(this.product);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.image),
    );
  }
}
