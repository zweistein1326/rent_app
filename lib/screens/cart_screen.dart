import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_tile.dart';
import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  static const routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Your Cart'),
      ),
      body: CartBlock(),
    );
  }
}

class CartBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProducts = Provider.of<Cart>(context).items;
    final cartProduct = cartProducts.values.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20),
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemBuilder: (ctx, index) =>
                CartTile(cartProduct: cartProduct, index: index),
            itemCount: cartProducts.length,
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: cartProducts.length > 0
              ? RaisedButton.icon(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    //Place Order
                  },
                  icon: Icon(Icons.place),
                  label: Text('Order Now'))
              : null,
        ),
      ],
    );
  }
}

// class OrderButton extends StatefulWidget {
//   const OrderButton({
//     Key key,
//     @required this.cart,
//   }) : super(key: key);

//   final Cart cart;

//   @override
//   _OrderButtonState createState() => _OrderButtonState();
// }

// class _OrderButtonState extends State<OrderButton> {
//   var _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
//       onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
//           ? null
//           : () async {
//               setState(() {
//                 _isLoading = true;
//               });
//               await Provider.of<Orders>(context, listen: false).addOrder(
//                 widget.cart.items.values.toList(),
//                 widget.cart.totalAmount,
//               );
//               setState(() {
//                 _isLoading = false;
//               });
//               widget.cart.clear();
//             },
//       textColor: Theme.of(context).primaryColor,
//     );
//   }
// }
