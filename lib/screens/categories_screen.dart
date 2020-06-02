import 'package:flutter/material.dart';
import 'package:rent_app/widgets/category_item.dart';
import '../widgets/app_drawer.dart';
import '../models/categories.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Categories'),
        ),
        body: GridView(
          padding: EdgeInsets.symmetric(horizontal: 5),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES
              .map(
                (catData) =>
                    CategoryItem(catData.id, catData.title, catData.color),
              )
              .toList(),
        ));
  }
}
