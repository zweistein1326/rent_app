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
  @override
  Widget build(BuildContext context) {
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height * 0.25,
            alignment: Alignment.center,
            child: Image.network(
              'https://www.telegraph.co.uk/content/dam/food-and-drink/2018/06/20/Veg_trans_NvBQzQNjv4Bqul3YgLXf2lEf3afmzmy4CHMT9HEIQzXrohIUnOkGrQA.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                IconButton(
                  color: Colors.black,
                  icon: Icon(
                    Icons.fastfood,
                    size: 80,
                  ),
                ),
                SizedBox(width: 50),
                IconButton(
                  color: Colors.black,
                  icon: Icon(
                    Icons.fastfood,
                    size: 80,
                  ),
                ),
                SizedBox(width: 50),
                IconButton(
                  color: Colors.black,
                  icon: Icon(
                    Icons.fastfood,
                    size: 80,
                  ),
                ),
                SizedBox(width: 50),
                IconButton(
                  color: Colors.black,
                  icon: Icon(
                    Icons.fastfood,
                    size: 80,
                  ),
                ),
                SizedBox(width: 50),
                
              ],
            ),
          ),
          ProductsGrid(),
        ]),
      ),
    );
  }
}
