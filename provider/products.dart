import 'package:flutter/cupertino.dart';
import 'package:mycarts/provider/cart_item.dart';

class Product with ChangeNotifier {
  final String id, category, name, descreption, image, color, size;
  final oldPrice;
  final currentPrice;
  bool isFavorite;
  bool isWish;
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
      this.isFavorite = false,
      this.isWish = false});

  changeFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  changeWishStatus() {
    isWish = !isWish;
    notifyListeners();
  }
}

class Products with ChangeNotifier {
  List<Product> _productsList = [
    Product(
        id: 'tops1',
        name: "pubg mobile1",
        category: 'pubg',
        descreption: "new pubg mobile1",
        image: 'assets/jpg/pubg.jpg',
        oldPrice: 700,
        currentPrice: 500),
    Product(
        id: 'tops2',
        name: "pubg mobile 2",
        category: 'pubg',
        descreption: "new pubg mobile 2",
        image: 'assets/jpg/pubg.jpg',
        oldPrice: 500,
        currentPrice: 300),
    Product(
        id: 'tops3',
        name: "pubg mobile 3",
        category: 'pubg',
        descreption: "new pubg mobile 3",
        image: 'assets/jpg/pubg.jpg',
        oldPrice: 600,
        currentPrice: 200),
    Product(
        id: 'tops4',
        name: "pubg mobile 4",
        category: 'pubg',
        descreption: "new pubg mobile 4",
        image: 'assets/jpg/pubg.jpg',
        oldPrice: 420,
        currentPrice: 120),
    Product(
        id: 'tops5',
        name: "pubg mobile 5",
        category: 'pubg',
        descreption: "new pubg mobile 5",
        image: 'assets/jpg/pubg.jpg',
        oldPrice: 300,
        currentPrice: 100),
    Product(
        id: 'tops6',
        name: "playstation credit1",
        category: 'cards',
        descreption: "new playstation credit1",
        image: 'assets/jpg/playstation.jpg',
        oldPrice: 700,
        currentPrice: 450),
    Product(
        id: 'tops7',
        name: "playstation credit2",
        category: 'cards',
        descreption: "new playstation credit 2",
        image: 'assets/jpg/playstation.jpg',
        oldPrice: 550,
        currentPrice: 350),
    Product(
        id: 'tops8',
        name: "playstation credit3",
        category: 'cards',
        descreption: "new playstation credit 3",
        image: 'assets/jpg/playstation.jpg',
        oldPrice: 650,
        currentPrice: 300),
    Product(
        id: 'tops9',
        name: "playstation credit4",
        category: 'cards',
        descreption: "new playstation credit 4",
        image: 'assets/jpg/playstation.jpg',
        oldPrice: 150,
        currentPrice: 50),
    Product(
        id: 'tops10',
        name: "playstation credit5",
        category: 'cards',
        descreption: "new playstation credit 5",
        image: 'assets/jpg/playstation.jpg',
        oldPrice: 50,
        currentPrice: 30),
    Product(
        id: 'tops11',
        name: "bitmap-2",
        category: 'bitmap',
        descreption: "Top fleece inside",
        image: 'assets/png/bitmap-2.png',
        oldPrice: 550,
        currentPrice: 350),
    Product(
        id: 'tops12',
        name: "bitmap-1",
        category: 'bitmap',
        descreption: "Black top super",
        image: 'assets/png/bitmap-1.png',
        oldPrice: 550,
        currentPrice: 450),
    Product(
        id: 'tops13',
        name: "bitmap",
        category: 'bitmap',
        descreption: "Black top super",
        image: 'assets/png/bitmap.png',
        oldPrice: 550,
        currentPrice: 450),
    Product(
        id: 'tops14',
        name: "bitmap-3",
        category: 'bitmap',
        descreption: "Black top super",
        image: 'assets/png/bitmap-3.png',
        oldPrice: 550,
        currentPrice: 450),
  ];

  List<Product> get productsList {
    return [..._productsList];
  }

  List<Product> get favoritesProducts {
    return _productsList.where((prod) => prod.isFavorite).toList();
  }

  List<Product> get wishesProducts {
    return _productsList.where((prod) => prod.isWish).toList();
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
      bool isWish,
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
              isWish: existingCartItem.isWish,
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
          isWish: isWish,
          image: image,
          quantity: quantity,
        );
      });
    }
    notifyListeners();
  }

  void removeCartItem(String productId) {
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
            isWish: existingCart.isWish,
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
