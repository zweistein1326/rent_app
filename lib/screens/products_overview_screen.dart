import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/providers/orders.dart';
import 'package:rent_app/providers/products.dart';
import 'package:rent_app/screens/account_screen.dart';
import 'package:rent_app/screens/order_summary_screen.dart';
import 'package:rent_app/widgets/products_grid.dart';
import '../widgets/app_drawer.dart';
import '../widgets/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/products-screen';

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void initState() {
    _pages = [
      {'page': ProductsGrid(), 'title': 'Shop'},
      {'page': SearchBar(), 'title': 'Search'},
      {'page': OrderSummaryBlock(), 'title': 'Cart'},
      {'page': AccountBlock(), 'title': 'Account'}
    ];
    super.initState();
  }

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) => {
            setState(() {
              _isLoading = false;
            })
          });
      Provider.of<Orders>(context).fetchAndSetUser().then((_) => {
            setState(() {
              _isLoading = false;
            })
          });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: AppDrawer(),
      bottomNavigationBar: Container(
        height: 75.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          color: Colors.orange,
        ),
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _selectPage(0);
                });
              },
            ),
            IconButton(
                icon: Icon(Icons.search),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _selectPage(1);
                  });
                }),
            IconButton(
                icon: Icon(Icons.shopping_basket),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _selectPage(2);
                  });
                }),
            IconButton(
                icon: Icon(Icons.person_outline),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _selectPage(3);
                  });
                }),
          ],
        ),
      ),
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
                    _pages[_selectedPageIndex]['title'],
                    style: GoogleFonts.lato(),
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart,
                        color: Theme.of(context).primaryColor),
                    onPressed: () {
                      //open cart screen
                      Navigator.of(context).pushNamed('order-summary');
                    },
                  ),
                ],
              ))),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _pages[_selectedPageIndex]['page'],
    );
  }
}
