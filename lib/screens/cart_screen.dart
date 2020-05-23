import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  static const routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final cartProducts = Provider.of<Cart>(context).items;
    final cartProduct = cartProducts.values.toList();
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Your Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              itemBuilder: (ctx, index) =>
                  CartTile(cartProduct: cartProduct, index: index),
              itemCount: cartProducts.length,
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: cartProducts.length > 0
                ? RaisedButton.icon(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      //Place Order
                    },
                    icon: Icon(Icons.place),
                    label: Text('Order Now'))
                : null,
          ),
        ],
      ),
    );
  }
}

class CartTile extends StatelessWidget {
  int index;
  CartTile({
    Key key,
    @required this.cartProduct,
    this.index,
  }) : super(key: key);

  final List<CartItem> cartProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(cartProduct[index].product.title),
                  trailing: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 40,
                          child: Text(
                            cartProduct[index].product.price.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            Provider.of<Cart>(context)
                                .removeItem(cartProduct[index].product);
                          },
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
