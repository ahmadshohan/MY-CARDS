import 'package:flutter/cupertino.dart';
import 'cart_item.dart';

class Product with ChangeNotifier {
  final String id, category, name, descreption, image, color, size;
  final oldPrice;
  final currentPrice;
  bool isFavorite;
  Product(
      {@required this.id,
      @required this.name,
      @required this.category,
      this.color,
      this.size,
      @required this.descreption,
      @required this.image,
      @required this.oldPrice,
      @required this.currentPrice,
      this.isFavorite = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class Products with ChangeNotifier {
  List<Product> _productsList = [
    Product(
        id: 'tops1',
        name: "Long sleeved top",
        category: 'Tops',
        descreption: "Long sleeved top /hit of season /",
        image: 'assets/jpg/dr1.jpeg',
        oldPrice: 70000,
        currentPrice: 50000),
    Product(
        id: 'tops2',
        name: "Black elegant top",
        category: 'Tops',
        descreption: "Black elegant top",
        image: 'assets/jpg/dr1.jpeg',
        oldPrice: 50000,
        currentPrice: 30000),
    Product(
        id: 'tops3',
        name: "Trendy grey top",
        category: 'Tops',
        descreption: "Trendy grey top /fleece inside/",
        image: 'assets/jpg/dr1.jpeg',
        oldPrice: 70000,
        currentPrice: 45000),
    Product(
        id: 'tops4',
        name: "Different cotton shirts",
        category: 'Tops',
        descreption: "Different cotton shirts",
        image: 'assets/jpg/dr1.jpeg',
        oldPrice: 55000,
        currentPrice: 30000),
    Product(
        id: 'tops5',
        name: "Top fleece inside ",
        category: 'Tops',
        descreption: "Top fleece inside",
        image: 'assets/jpg/dr1.jpeg',
        oldPrice: 55000,
        currentPrice: 35000),
    Product(
        id: 'tops7',
        name: "Black top super",
        category: 'Tops',
        descreption: "Black top super",
        image: 'assets/jpg/dr1.jpeg',
        oldPrice: 55000,
        currentPrice: 45000),
    Product(
        id: 'tops8',
        name: "Trendy top ",
        category: 'Tops',
        descreption: "Trendy top with leather sleeves",
        image: 'assets/jpg/dr1.jpeg',
        oldPrice: 70000,
        currentPrice: 50000),
    Product(
        id: 'tops12',
        name: "Elegant crop top ",
        category: 'Tops',
        descreption: "Elegant crop top with paillettes",
        image: 'assets/jpg/dr1.jpeg',
        oldPrice: 80000,
        currentPrice: 65000),
  ];

  List<Product> get productsList {
    return [..._productsList];
  }

  List<Product> get favoritesProducts {
    return _productsList.where((prod) => prod.isFavorite).toList();
  }

  Product findById(String id) {
    return _productsList.firstWhere((prod) => prod.id == id);
  }

  //*******************************cartData******************
  Map<String, CartItem> _cartItems = {};
  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  int get itemCount {
    return _cartItems.length;
  }

  int get totalAmount {
    var total = 0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.currentPrice * cartItem.quantity;
    });
    return total;
  }

  // void increaseCartItemQuantity(String productId) {
  //   if (_cartItems.containsKey(productId)) {
  //     _cartItems.update(
  //         productId,
  //         (existingCartItem) => CartItem(
  //             id: existingCartItem.id,
  //             title: existingCartItem.title,
  //             color: existingCartItem.color,
  //             size: existingCartItem.size,
  //             price: existingCartItem.price,
  //             image: existingCartItem.image,
  //             quantity: existingCartItem.quantity + 1));
  //     notifyListeners();
  //   }
  // }

  // void decreaseCartItemQuantity(String productId) {
  //   if (_cartItems.containsKey(productId)) {
  //     _cartItems.update(productId, (existingCartItem) {
  //       return CartItem(
  //           id: existingCartItem.id,
  //           title: existingCartItem.title,
  //           color: existingCartItem.color,
  //           size: existingCartItem.size,
  //           price: existingCartItem.price,
  //           image: existingCartItem.image,
  //           quantity: existingCartItem.quantity > 1
  //               ? existingCartItem.quantity - 1
  //               : 1);
  //     });
  //     notifyListeners();
  //   }
  // }

  void addCart(
      {String productId,
      int currentPrice,
      int oldPrice,
      bool isFavorite,
      String color = 'red',
      String size = 'small',
      int quantity = 1,
      String image,
      String title}) {
    if (cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              color: existingCartItem.color,
              size: existingCartItem.size,
              currentPrice: existingCartItem.currentPrice,
              oldPrice: existingCartItem.oldPrice,
              isFavorite: existingCartItem.isFavorite,
              image: existingCartItem.image,
              quantity: existingCartItem.quantity + 1));
    } else {
      _cartItems.putIfAbsent(productId, () {
        return CartItem(
          id: DateTime.now().toString(),
          title: title,
          color: color,
          size: size,
          oldPrice: oldPrice,
          currentPrice: currentPrice,
          isFavorite: isFavorite,
          image: image,
          quantity: quantity,
        );
      });
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_cartItems.containsKey(productId)) {
      return;
    }
    if (_cartItems[productId].quantity > 1) {
      _cartItems.update(productId, (existingCart) {
        return CartItem(
            id: existingCart.id,
            title: existingCart.title,
            currentPrice: existingCart.currentPrice,
            oldPrice: existingCart.oldPrice,
            isFavorite: existingCart.isFavorite,
            image: existingCart.image,
            quantity: existingCart.quantity - 1);
      });
    } else {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}
