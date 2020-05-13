import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String image;
  final String description;
  bool isFav;

  Product(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.description,
      this.image,
      this.isFav = false});

  void toggleFavStatus() {
    isFav = !isFav;
    notifyListeners();
  }
}
