import 'package:flutter/material.dart';
import 'package:rent_app/widgets/products_grid.dart';
import '../models/categories.dart';
import '../models/categories.dart';
import '../models/categories.dart';
import '../models/categories.dart';
import '../models/categories.dart';
import '../models/categories.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../presentation/my_flutter_app_icons.dart';
import '';

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/products-screen';

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var cat;
  @override
  void initState() {
    // TODO: implement initState
    cat = ItemCategory.all;
    super.initState();
  }

  void changeCategory() {}

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
                    style: GoogleFonts.lato(),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: IconButton(
                    icon: cat == ItemCategory.food
                        ? Icon(
                            MyFlutterApp.food,
                            size: 40,
                            color: Theme.of(context).primaryColor,
                          )
                        : Icon(
                            MyFlutterApp.food,
                            size: 40,
                          ),
                    onPressed: () {
                      setState(() {
                        cat = ItemCategory.food;
                      });
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: IconButton(
                    icon: cat == ItemCategory.bed
                        ? Icon(
                            MyFlutterApp.bed,
                            size: 40,
                            color: Theme.of(context).primaryColor,
                          )
                        : Icon(
                            MyFlutterApp.bed,
                            size: 40,
                          ),
                    onPressed: () {
                      setState(() {
                        cat = ItemCategory.bed;
                      });
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: IconButton(
                    icon: cat == ItemCategory.music
                        ? Icon(
                            MyFlutterApp.note_beamed,
                            size: 40,
                            color: Theme.of(context).primaryColor,
                          )
                        : Icon(
                            MyFlutterApp.note_beamed,
                            size: 40,
                          ),
                    onPressed: () {
                      setState(() {
                        cat = ItemCategory.music;
                      });
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: IconButton(
                    icon: cat == ItemCategory.sports
                        ? Icon(
                            MyFlutterApp.football_ball,
                            size: 40,
                            color: Theme.of(context).primaryColor,
                          )
                        : Icon(
                            MyFlutterApp.football_ball,
                            size: 40,
                          ),
                    onPressed: () {
                      setState(() {
                        cat = ItemCategory.sports;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ProductsGrid(cat),
        ]),
      ),
    );
  }
}
