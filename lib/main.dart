import 'package:flutter/material.dart';
import 'package:rent_app/screens/account_screen.dart';
import 'package:rent_app/screens/cart_screen.dart';
import './screens/categories_screen.dart';
import './screens/product_details_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/auth_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/product.dart';
import './providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Users(),
        ),
      ],
      child: MaterialApp(
        title: 'Rent-App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.black,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        home: AuthScreen(),
        routes: {
          ProductDetails.routeName: (ctx) => ProductDetails(),
          ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
          CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
          AccountScreen.routeName: (ctx) => AccountScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
