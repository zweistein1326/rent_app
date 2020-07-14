import 'package:flutter/material.dart';

import './product.dart';

class CartItem {
  final String id;
  final int quantity;
  final Product product;

  CartItem({this.id, this.quantity, this.product});
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
          product: item,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        item.id,
        () => CartItem(
          id: item.id,
          product: item,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.remove(product.id);
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }
}
