import 'package:flutter/material.dart';
import '../models/categories.dart';
import './product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //     id: 'p1',
    //     title: 'Book',
    //     price: 14.99,
    //     image:
    //         'https://assets.entrepreneur.com/content/3x2/2000/20191219170611-GettyImages-1152794789.jpeg',
    //     description: 'This is an amazing book for entreprenuers',
    //     category: ItemCategory.music),
    // Product(
    //     id: 'p2',
    //     title: 'Television',
    //     price: 109.99,
    //     image:
    //         'https://imgaz.staticbg.com/thumb/large/oaupload/ser1/banggood/images/99/6C/44f193a0-eced-41e4-ba78-226d7b3b25f8.jpg',
    //     description: 'Samnsung TV',
    //     category: ItemCategory.bed),
    // Product(
    //     id: 'p2',
    //     title: 'Television',
    //     price: 99.99,
    //     image:
    //         'https://imgaz.staticbg.com/thumb/large/oaupload/ser1/banggood/images/99/6C/44f193a0-eced-41e4-ba78-226d7b3b25f8.jpg',
    //     description: 'Samnsung TV',
    //     category: ItemCategory.food)
  ];
  String searchString = '';

  List<Product> items() {
    // if (category != ItemCategory.all) {
    //   return [
    //     ..._items.where((element) =>
    //         (element.title.toLowerCase().contains(searchString) &&
    //             element.category == category))
    //   ];
    // }
    fetchAndSetProducts();
    return [
      ..._items.where(
          (element) => (element.title.toLowerCase().contains(searchString)))
    ];
  }

  void searchByItem(input) {
    searchString = input;
    notifyListeners();
  }

  Future<void> fetchAndSetProducts() async {
    const url = "https://rent-app-52a40.firebaseio.com/products.json";
    final data = await http.get(url);
    final loadedProducts = json.decode(data.body) as Map<String, dynamic>;
    List<Product> products = [];
    loadedProducts.forEach((prodId, prodData) {
      products.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          image: prodData['image']));
    });
    _items = products;
    notifyListeners();
  }

  void addProduct() async {
    const url = "https://rent-app-52a40.firebaseio.com/products.json";
    _items.forEach((element) {
      http.post(url,
          body: json.encode({
            'id': element.id,
            'title': element.title,
            'description': element.description,
            'price': element.price,
            'image': element.image,
          }));
    });
  }
}
