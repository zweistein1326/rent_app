import 'package:flutter/material.dart';
import '../providers/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile(this.product);
  @override
  Widget build(BuildContext context) {
    return Tile(product: product);
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/product-details', arguments: product);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    blurRadius: 6.0,
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5.0)
              ]),
          child: Stack(
            children: <Widget>[
              Container(
                height: 175.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
              ),
              Hero(
                tag: product.id,
                child: Container(
                  height: 175.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                        product.image,
                      ))),
                ),
              ),
              Positioned(
                top: 160,
                right: 20.0,
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 17.0,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 190,
                left: 10.0,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Container(
                        width: 175.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  '4.9',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 14.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 14.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 14.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 14.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 14.0,
                                ),
                              ],
                            ),
                            Text(
                              '₹${product.price.toString()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 16.0),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
