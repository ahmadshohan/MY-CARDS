// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingCartController on _ShoppingCartControllerBase, Store {
  final _$cartAtom = Atom(name: '_ShoppingCartControllerBase.cart');

  @override
  Products get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(Products value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  final _$cartItemsAtom = Atom(name: '_ShoppingCartControllerBase.cartItems');

  @override
  Map<String, CartItem> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(Map<String, CartItem> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ShoppingCartControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$isFavoriteAtom = Atom(name: '_ShoppingCartControllerBase.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  @override
  String toString() {
    return '''
cart: ${cart},
cartItems: ${cartItems},
loading: ${loading},
isFavorite: ${isFavorite}
    ''';
  }
}
