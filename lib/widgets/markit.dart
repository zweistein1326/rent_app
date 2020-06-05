import 'package:flutter/material.dart';
import '../presentation/my_flutter_app_icons.dart';
import '../models/categories.dart';
import './products_grid.dart';

class MarkIt extends StatefulWidget {
  var cat;
  MarkIt(this.cat);

  @override
  _MarkItState createState() => _MarkItState();
}

class _MarkItState extends State<MarkIt> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
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
                  icon: widget.cat == ItemCategory.food
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
                      widget.cat = ItemCategory.food;
                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: IconButton(
                  icon: widget.cat == ItemCategory.bed
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
                      widget.cat = ItemCategory.bed;
                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: IconButton(
                  icon: widget.cat == ItemCategory.music
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
                      widget.cat = ItemCategory.music;
                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: IconButton(
                  icon: widget.cat == ItemCategory.sports
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
                      widget.cat = ItemCategory.sports;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        ProductsGrid(widget.cat),
      ]),
    );
  }
}
