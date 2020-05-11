import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/screens/categories_screen.dart';
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
        title: Text('Your Products'),
      ),
      body: index == 0
          ? Center(
              child: ListView.builder(
                itemBuilder: (ctx, i) => ProductTile(products[i]),
                itemCount: products.length,
              ),
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
            title: Text('Categories'),
            icon: Icon(Icons.category),
          ),
        ],
      ),
    );
  }
}
