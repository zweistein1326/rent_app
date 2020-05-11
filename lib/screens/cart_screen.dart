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
      body: Container(
        padding: EdgeInsets.only(left: 20),
        child: ListView.builder(
          itemBuilder: (ctx, index) => ListTile(
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
                    onPressed: () {},
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ),
          itemCount: cartProducts.length,
        ),
      ),
    );
  }
}
