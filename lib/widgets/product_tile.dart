import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../screens/product_details_screen.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile(this.product);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(12),
      leading: Image.network(
        product.image,
        height: 100,
        width: 100,
      ),
      title: Text(product.title),
      trailing: Container(
        width: MediaQuery.of(context).size.width * 0.32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              child: Text(
                product.price.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                //add to cart
              },
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetails.routeName, arguments: product);
      },
    );
  }
}
