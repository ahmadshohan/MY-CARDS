import 'package:flutter/foundation.dart';

class CartItem {
  final String id, title, color, size;
  final oldPrice;
  final currentPrice;
  final isFavorite;
  final String image;
  int quantity = 0;
  CartItem(
      {@required this.id,
      @required this.title,
      this.color,
      this.size,
      @required this.currentPrice,
      @required this.oldPrice,
      @required this.isFavorite,
      @required this.image,
      @required this.quantity});
}
