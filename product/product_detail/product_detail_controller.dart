import 'package:mycarts/app_route.dart';
import 'package:mycarts/provider/cart_item.dart';
import 'package:mycarts/provider/orders.dart';
import 'package:mycarts/provider/products.dart';
import 'package:mycarts/shared/services/preferences_service.dart';
import 'package:mycarts/shared/widgets/dialogs/AppDialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'product_detail_controller.g.dart';

class ProductDetailController = _ProductDetailControllerBase
    with _$ProductDetailController;

abstract class _ProductDetailControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();

  Future init(BuildContext context) async {
    size = 'small';
    quantity = 1;
    cart = Provider.of<Products>(context);
    cartItems = cart.cartItems;
  }

  @observable
  Products cart = Products();
  @observable
  Map<String, CartItem> cartItems = Map();

  @observable
  bool loading = false;

  @observable
  bool isFavorite = false;

  @observable
  String size = 'small';

  @observable
  int quantity = 1;

  @action
  void selectedSize(String selectedSize) {
    size = selectedSize;
  }

  @action
  void selectedQuantity(int selectedQuantity) {
    quantity = selectedQuantity;
  }

  @action
  handleBuyNow(BuildContext context) async {
    loading = true;
    Provider.of<Orders>(context, listen: false).addOrder(
      cart.cartItems.values.toList(),
      cart.totalAmount,
    );
    loading = false;
    cart.clear();
    await AppDialogs.successOrderDialog(context);
    Navigator.pushReplacementNamed(context, AppRoute.ordersRoute);
  }

  // @action
  // handleAddToShoppingCart(Products productsData, Product loadedProduct) {
  //   loading = true;
  //   productsData.addCart(
  //     productId: loadedProduct.id,
  //     title: loadedProduct.name,
  //     quantity: quantity,
  //     currentPrice: loadedProduct.currentPrice,
  //     oldPrice: loadedProduct.oldPrice,
  //     isFavorite: loadedProduct.isFavorite,
  //     image: loadedProduct.image,
  //     size: size,
  //   );
  //   loading = false;
  // }
}
