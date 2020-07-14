import 'package:flutter/material.dart';
import 'package:rent_app/providers/auth.dart';
import 'package:rent_app/screens/account_screen.dart';
import 'package:rent_app/screens/cart_screen.dart';
import 'package:rent_app/screens/enter_details_screen.dart';
import './screens/categories_screen.dart';
import './screens/product_details_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/auth_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';
import 'providers/user.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: User(),
        ),
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Rent-App',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            accentColor: Colors.black,
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(),
            appBarTheme: AppBarTheme(
              color: Colors.white,
            ),
          ),
          home: auth.isAuth ? EnterDetailsScreen() : AuthScreen(),
          routes: {
            ProductDetails.routeName: (ctx) => ProductDetails(),
            ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
            CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
            AccountScreen.routeName: (ctx) => AccountScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
          },
        ),
      ),
    );
  }
}
