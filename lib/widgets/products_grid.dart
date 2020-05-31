import 'package:flutter/material.dart';
import './product_tile.dart';
import '../providers/product.dart';

class ProductsGrid extends StatelessWidget {
  List<Product> products;
  ProductsGrid(this.products);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          alignment: Alignment.center,
          child: Image.network(
            'https://www.telegraph.co.uk/content/dam/food-and-drink/2018/06/20/Veg_trans_NvBQzQNjv4Bqul3YgLXf2lEf3afmzmy4CHMT9HEIQzXrohIUnOkGrQA.jpg',
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
          ),
          height: MediaQuery.of(context).size.height * 0.23,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) => ProductTile(products[i]),
            itemCount: products.length,
          ),
        ),
        ListTile(
          title: Text(
            'Household',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
          ),
          height: MediaQuery.of(context).size.height * 0.23,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) => ProductTile(products[i]),
            itemCount: products.length,
          ),
        ),
        ListTile(
          title: Text('Add products by categories on this screen'),
        )
      ],
    );

    // ),

    //   Expanded(
    //       child: Column(
    //     children: <Widget>[
    //       Text('Add products by categories on this screen.')
    //     ],
    //   ))
    // ],
    // );
  }
}
