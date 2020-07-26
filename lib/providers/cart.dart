import 'package:flutter/material.dart';

import './product.dart';

class CartItem {
  final String id;
  final int quantity;
  final String title;
  final double price;

  CartItem({this.id, this.quantity, this.title, this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(Product item) {
    if (_items.containsKey(item.id)) {
      //increase count
      _items.update(
        item.id,
        (existingItem) => CartItem(
          id: item.id,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
          title: existingItem.title,
        ),
      );
    } else {
      _items.putIfAbsent(
        item.id,
        () => CartItem(
          id: item.id,
          quantity: 1,
          price: item.price,
          title: item.title,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void increaseItemCount(String id) {
    _items.update(
      id,
      (existingItem) => CartItem(
        id: id,
        quantity: existingItem.quantity + 1,
        price: existingItem.price,
        title: existingItem.title,
      ),
    );
    notifyListeners();
  }

  void decreaseItemCount(String id) {
    _items.update(
      id,
      (existingItem) => CartItem(
        id: id,
        quantity: existingItem.quantity - 1,
        price: existingItem.price,
        title: existingItem.title,
      ),
    );
    notifyListeners();
  }
}
