// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_products_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AllProductsController on _AllProductsControllerBase, Store {
  final _$showListAtom = Atom(name: '_AllProductsControllerBase.showList');

  @override
  bool get showList {
    _$showListAtom.reportRead();
    return super.showList;
  }

  @override
  set showList(bool value) {
    _$showListAtom.reportWrite(value, super.showList, () {
      super.showList = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AllProductsControllerBase.loading');

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

  final _$langAtom = Atom(name: '_AllProductsControllerBase.lang');

  @override
  String get lang {
    _$langAtom.reportRead();
    return super.lang;
  }

  @override
  set lang(String value) {
    _$langAtom.reportWrite(value, super.lang, () {
      super.lang = value;
    });
  }

  final _$_AllProductsControllerBaseActionController =
      ActionController(name: '_AllProductsControllerBase');

  @override
  bool isRtl() {
    final _$actionInfo = _$_AllProductsControllerBaseActionController
        .startAction(name: '_AllProductsControllerBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_AllProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeView() {
    final _$actionInfo = _$_AllProductsControllerBaseActionController
        .startAction(name: '_AllProductsControllerBase.changeView');
    try {
      return super.changeView();
    } finally {
      _$_AllProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showList: ${showList},
loading: ${loading},
lang: ${lang}
    ''';
  }
}
