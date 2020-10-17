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

  @observable
  bool offer5 = false;

  @observable
  bool offer30 = false;

  @observable
  bool offer58 = false;

  @observable
  bool offer128 = false;

  @observable
  bool offer288 = false;

  @observable
  bool offer440 = false;

  @observable
  bool offer880 = false;

  @action
  void selectedOffer5() {
    if (offer30 == false &&
        offer58 == false &&
        offer128 == false &&
        offer288 == false &&
        offer440 == false &&
        offer880 == false)
      offer5 = !offer5;
    else
      offer5 = offer5;
  }

  @action
  void selectedOffer30() {
    if (offer5 == false &&
        offer58 == false &&
        offer128 == false &&
        offer288 == false &&
        offer440 == false &&
        offer880 == false)
      offer30 = !offer30;
    else
      offer30 = offer30;
  }

  @action
  void selectedOffer58() {
    if (offer5 == false &&
        offer30 == false &&
        offer128 == false &&
        offer288 == false &&
        offer440 == false &&
        offer880 == false)
      offer58 = !offer58;
    else
      offer58 = offer58;
  }

  @action
  void selectedOffer128() {
    if (offer5 == false &&
        offer30 == false &&
        offer58 == false &&
        offer288 == false &&
        offer440 == false &&
        offer880 == false)
      offer128 = !offer128;
    else
      offer128 = offer128;
  }

  @action
  void selectedOffer288() {
    if (offer5 == false &&
        offer30 == false &&
        offer58 == false &&
        offer128 == false &&
        offer440 == false &&
        offer880 == false)
      offer288 = !offer288;
    else
      offer288 = offer288;
  }

  @action
  void selectedOffer440() {
    if (offer5 == false &&
        offer30 == false &&
        offer58 == false &&
        offer128 == false &&
        offer288 == false &&
        offer880 == false)
      offer440 = !offer440;
    else
      offer440 = offer440;
  }

  @action
  void selectedOffer880() {
    if (offer5 == false &&
        offer30 == false &&
        offer58 == false &&
        offer128 == false &&
        offer288 == false &&
        offer440 == false)
      offer880 = !offer880;
    else
      offer880 = offer880;
  }

  @action
  void selectedSize(String selectedSize) {
    size = selectedSize;
  }

  @action
  selectedQuantity(int selectedQuantity) {
    quantity = selectedQuantity;
  }

  @action
  buyNow(BuildContext context) async {
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
