import 'package:flutter/material.dart';
import './cart.dart';
import 'package:http/http.dart' as http;
import './user.dart';
import 'dart:convert';
import 'dart:async';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    this.id,
    this.amount,
    this.products,
    this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  final String authToken;
  final String userId;

  var _user = User(name: '', address: '', contact: '');

  Orders(this.authToken, this.userId, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final url =
        "https://rent-app-52a40.firebaseio.com/orders/$userId.json?auth=$authToken";
    final response = await http.get(url);
    final List<OrderItem> _loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      _loadedOrders.add(
        OrderItem(
          id: orderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
                    id: item['id'],
                    quantity: item['quantity'],
                    price: item['price'],
                    title: item['title']),
              )
              .toList(),
        ),
      );
    });
    _orders = _loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url =
        'https://rent-app-52a40.firebaseio.com/orders/$userId.json?auth=$authToken';
    final timestamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'quantity': cp.quantity,
                  'title': cp.title,
                  'price': cp.price
                })
            .toList(),
        'user': {
          'name': user.name,
          'address': user.address,
          'contact': user.contact
        },
      }),
    );
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }

  //Users Data

  User get user {
    return _user;
  }

  Future<void> fetchAndSetUser() async {
    var url =
        "https://rent-app-52a40.firebaseio.com/users/$userId.json?auth=$authToken";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    User _loadedUser = User(name: '', contact: '', address: '');
    _loadedUser = User(
      name: extractedData['name'],
      contact: extractedData['contact'],
      address: extractedData['address'],
    );
    _user = _loadedUser;

    notifyListeners();
  }

  Future<void> updateUser(User user) async {
    var url =
        "https://rent-app-52a40.firebaseio.com/users/$userId.json?auth=$authToken";
    await http.patch(
      url,
      body: json.encode({
        'name': user.name,
        'contact': user.contact,
        'address': user.address,
      }),
    );
    final newUser = User(
      name: user.name,
      contact: user.contact,
      address: user.address,
    );
    _user = newUser;
    notifyListeners();
  }
}
