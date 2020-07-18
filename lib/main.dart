import 'package:flutter/material.dart';
import 'package:rent_app/providers/auth.dart';
import 'package:rent_app/providers/orders.dart';
import 'package:rent_app/screens/account_screen.dart';
import 'package:rent_app/screens/cart_screen.dart';
import 'package:rent_app/screens/edit_details_screen.dart';
import 'package:rent_app/screens/order_summary_screen.dart';
import 'package:rent_app/screens/orders_screen.dart';
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
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousOrders) => Orders(
            auth.token,
            auth.userId,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: User(),
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
          home: auth.isAuth
              ? ProductsOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, _) => AuthScreen(),
                ),
          routes: {
            ProductDetails.routeName: (ctx) => ProductDetails(),
            ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
            CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
            AccountScreen.routeName: (ctx) => AccountScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrderSummaryScreen.routeName: (ctx) => OrderSummaryScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            EditDetailsScreen.routeName: (ctx) => EditDetailsScreen()
          },
        ),
      ),
    );
  }
}
