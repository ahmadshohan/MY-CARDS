// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryController on _CategoryControllerBase, Store {
  final _$showListAtom = Atom(name: '_CategoryControllerBase.showList');

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

  final _$loadingAtom = Atom(name: '_CategoryControllerBase.loading');

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

  final _$langAtom = Atom(name: '_CategoryControllerBase.lang');

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

  final _$_CategoryControllerBaseActionController =
      ActionController(name: '_CategoryControllerBase');

  @override
  bool isRtl() {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeView() {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.changeView');
    try {
      return super.changeView();
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
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
