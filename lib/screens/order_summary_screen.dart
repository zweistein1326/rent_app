import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/providers/orders.dart';
import 'package:rent_app/providers/user.dart';
import 'package:rent_app/screens/account_screen.dart';
import 'package:rent_app/widgets/cart_tile.dart';
import 'package:rent_app/widgets/enter_details_form.dart';
import '../providers/cart.dart';

class OrderSummaryScreen extends StatefulWidget {
  static const routeName = 'order-summary';
  @override
  _OrderSummaryScreenState createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Order Summary'),
        ),
        body: OrderSummaryBlock());
  }
}

class OrderSummaryBlock extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<OrderSummaryBlock> {
  final _form = GlobalKey<FormState>();
  var cart;
  var cartProduct;
  var _user;
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    cart = Provider.of<Cart>(context);
    cartProduct = cart.items.values.toList();
    _user = Provider.of<Orders>(context).user;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : cartProduct.length > 0
            ? Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            // height: MediaQuery.of(context).size.height * 0.4,
                            child: ListView.builder(
                              itemBuilder: (ctx, index) => CartTile(
                                cartProduct: cartProduct,
                                index: index,
                              ),
                              itemCount: cart.items.length,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 20),
                            width: double.infinity,
                            child: Text(
                              'Bill Total: ₹${cart.totalAmount.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: double.infinity,
                      child: RaisedButton.icon(
                        color: Theme.of(context).primaryColor,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {
                          Navigator.of(context).pushNamed('/payment-screen');
                        },
                        icon: Icon(Icons.done),
                        label: Text('Place Order'),
                      ),
                    ),
                    AccountBlock(),
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'Your cart is empty',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
  }
}
