import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/providers/orders.dart';
import 'package:rent_app/providers/user.dart';
import 'package:rent_app/widgets/enter_details_form.dart';
import '../providers/cart.dart';

class OrderSummaryScreen extends StatefulWidget {
  static const routeName = 'order-summary';
  @override
  _OrderSummaryScreenState createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  final _form = GlobalKey<FormState>();
  var cart;
  var cartProduct;
  var _user;
  var _isLoading = false;

  Future<void> saveForm(User editedUser) async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    await Provider.of<Orders>(context, listen: false).updateUser(editedUser);
    await Provider.of<Orders>(context, listen: false)
        .addOrder(cartProduct, cart.totalAmount);
    setState(() {
      _isLoading = false;
    });
    showDialog(
        context: context,
        builder: (ctx) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Thank you. Your order has been confirmed',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text('Go to Home'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .popAndPushNamed('/products-screen');
                        },
                      )
                    ],
                  ),
                ),
              ),
            ));
    cart.clear();
  }

  @override
  Widget build(BuildContext context) {
    cart = Provider.of<Cart>(context);
    cartProduct = cart.items.values.toList();
    _user = Provider.of<Orders>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
                      child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) => ListTile(
                        title: Text(cartProduct[index].title),
                        trailing: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('x${cartProduct[index].quantity}'),
                              SizedBox(
                                width: 20,
                              ),
                              Text((cartProduct[index].price *
                                      cartProduct[index].quantity)
                                  .toStringAsFixed(2))
                            ],
                          ),
                        ),
                      ),
                      itemCount: cart.items.length,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: EnterDetailsForm(
                        saveForm: saveForm, form: _form, editedUser: _user),
                  ),
                ],
              ),
          ),
    );
  }
}
