import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/widgets/products_grid.dart';
import '../screens/categories_screen.dart';
import '../screens/cart_screen.dart';
import '../providers/products.dart';
import '../widgets/product_tile.dart';
import '../widgets/app_drawer.dart';
import '../widgets/search_bar.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = '/products-screen';

  final searchState = false;

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context).items;

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'MarkIt',
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart,
                        color: Theme.of(context).primaryColor),
                    onPressed: () {
                      //open cart screen
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  ),
                ],
              ))),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SearchBar(),
          ProductsGrid(products),
        ]),
      ),
    );
  }
}
