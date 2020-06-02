import 'package:flutter/material.dart';
import '../models/categories.dart';
import '../models/categories.dart';
import '../models/categories.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Book',
        price: 12.99,
        image:
            'https://assets.entrepreneur.com/content/3x2/2000/20191219170611-GettyImages-1152794789.jpeg',
        description: 'This is an amazing book for entreprenuers',
        category: ItemCategory.music),
    Product(
        id: 'p2',
        title: 'Television',
        price: 12.99,
        image:
            'https://imgaz.staticbg.com/thumb/large/oaupload/ser1/banggood/images/99/6C/44f193a0-eced-41e4-ba78-226d7b3b25f8.jpg',
        description: 'Samnsung TV',
        category: ItemCategory.bed),
    Product(
        id: 'p2',
        title: 'Television',
        price: 12.99,
        image:
            'https://imgaz.staticbg.com/thumb/large/oaupload/ser1/banggood/images/99/6C/44f193a0-eced-41e4-ba78-226d7b3b25f8.jpg',
        description: 'Samnsung TV',
        category: ItemCategory.food)
  ];
  String searchString = '';

  List<Product> items(ItemCategory category) {
    if (category != ItemCategory.all) {
      return [
        ..._items.where((element) =>
            (element.title.toLowerCase().contains(searchString) &&
                element.category == category))
      ];
    }
    return [
      ..._items.where(
          (element) => (element.title.toLowerCase().contains(searchString)))
    ];
  }

  void searchByItem(input) {
    searchString = input;
    notifyListeners();
  }
}
