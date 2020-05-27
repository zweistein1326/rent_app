import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/categories_screen.dart';
import '../screens/cart_screen.dart';
import '../providers/products.dart';
import '../widgets/product_tile.dart';
import '../widgets/app_drawer.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = '/products-screen';

  final searchState = false;

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context).items('');
    void searchByItem(searchString) {}

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
      body: Column(
        children: <Widget>[
          SearchBar(searchByItem),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            alignment: Alignment.center,
            child: Image.network(
              'https://www.telegraph.co.uk/content/dam/food-and-drink/2018/06/20/Veg_trans_NvBQzQNjv4Bqul3YgLXf2lEf3afmzmy4CHMT9HEIQzXrohIUnOkGrQA.jpg',
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
          Container(
            width: double.infinity,
            child: Text(
              'Household',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
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
          Expanded(
              child: Column(
            children: <Widget>[
              Text('Add products by categories on this screen.')
            ],
          ))
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final Function searchByItem;
  SearchBar(this.searchByItem);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var searchKeyWord = '';
  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black26)),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Search Product',
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
        ),
        onChanged: widget.searchByItem,
      ),
    );
  }
}
