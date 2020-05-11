import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/categories_screen.dart';
import '../screens/cart_screen.dart';
import '../providers/products.dart';
import '../widgets/product_tile.dart';
import '../widgets/app_drawer.dart';

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/products-screen';

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  int index = 0;
  void _selectPage(i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;
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
                  Text('Market'),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      //open cart screen
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  )
                ],
              ))),
      body: index == 0
          ? Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  alignment: Alignment.center,
                  child: Text(
                    "THIS IS MY APPPPPP",
                    style: TextStyle(
                      fontSize: 40,
                    ),
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
              ],
            )
          : Center(
              child: Text("Favorites"),
            ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: index,
        elevation: 0,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              title: Text('Favorites'),
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite)),
        ],
      ),
    );
  }
}
