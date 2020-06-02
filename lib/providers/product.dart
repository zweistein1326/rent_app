import 'package:flutter/foundation.dart';
import '../models/categories.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String image;
  final String description;
  ItemCategory category;
  bool isFav;

  Product(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.description,
      @required this.category,
      this.image,
      this.isFav = false});

  void toggleFavStatus() {
    isFav = !isFav;
    notifyListeners();
  }
}
