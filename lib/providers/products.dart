import 'package:flutter/material.dart';
import './product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [];
  String searchString = '';

  final String authToken;
  final String userId;

  Products(this.authToken, this.userId, this._items);

  List<Product> get items {
    // if (category != ItemCategory.all) {
    //   return [
    //     ..._items.where((element) =>
    //         (element.title.toLowerCase().contains(searchString) &&
    //             element.category == category))
    //   ];
    // }
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
    print('fetchAndSetProds');
    print(userId);
    print(authToken);
    var url =
        "https://rent-app-52a40.firebaseio.com/products.json?auth=$authToken";
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
