import 'package:flutter/material.dart';
import 'package:rent_app/providers/product.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final int index;
  CartTile({
    Key key,
    @required this.cartProduct,
    this.index,
  }) : super(key: key);

  final List<CartItem> cartProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(cartProduct[index].title),
                  trailing: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: FlatButton(
                            child: Text('-'),
                            onPressed: () {
                              Provider.of<Cart>(context)
                                  .decreaseItemCount(cartProduct[index].id);
                            },
                          ),
                        ),
                        Text(
                          '${cartProduct[index].quantity}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: FlatButton(
                            child: Text('+'),
                            onPressed: () {
                              Provider.of<Cart>(context)
                                  .increaseItemCount(cartProduct[index].id);
                            },
                          ),
                        ),

                        CircleAvatar(
                          radius: 40,
                          child: Text(
                            (cartProduct[index].price *
                                    cartProduct[index].quantity)
                                .toStringAsFixed(2),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.delete),
                        //   onPressed: () {
                        //     showDialog(
                        //       context: context,
                        //       builder: (ctx) => AlertDialog(
                        //         title: Text('Are you sure?'),
                        //         content: Text(
                        //           'Do you want to remove the item from the cart?',
                        //           style: TextStyle(color: Colors.black),
                        //         ),
                        //         actions: <Widget>[
                        //           FlatButton(
                        //             child: Text('No'),
                        //             onPressed: () {
                        //               Navigator.of(ctx).pop(false);
                        //             },
                        //           ),
                        //           FlatButton(
                        //             child: Text('Yes'),
                        //             onPressed: () {
                        //               Provider.of<Cart>(context)
                        //                   .removeItem(cartProduct[index].id);
                        //               Navigator.of(ctx).pop(true);
                        //             },
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        //   color: Colors.red,
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
