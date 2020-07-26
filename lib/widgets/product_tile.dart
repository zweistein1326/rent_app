import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_details_screen.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile(this.product);
  @override
  Widget build(BuildContext context) {
    return Tile(product: product);
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          product.image != null
              ? Image.network(
                  product.image,
                  fit: BoxFit.fitHeight,
                  height: MediaQuery.of(context).size.height * 0.30,
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Text('Image not available'),
                ),
          Text(
            product.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            '₹${product.price.toString()}',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          RaisedButton.icon(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Provider.of<Cart>(context).addItem(product);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Added ${product.title} to cart'),
                action: SnackBarAction(
                  textColor: Theme.of(context).primaryColor,
                  label: 'Undo',
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Removed from cart'),
                    ));
                    Provider.of<Cart>(context).removeItem(product.id);
                  },
                ),
              ));
            },
            icon: Icon(Icons.add_shopping_cart),
            label: Text('Add to Cart'),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetails.routeName, arguments: product);
      },
    );
  }
}
