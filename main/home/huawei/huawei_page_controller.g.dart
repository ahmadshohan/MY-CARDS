// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'huawei_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HuaweiPageController on _HuaweiPageControllerBase, Store {
  final _$loadingAtom = Atom(name: '_HuaweiPageControllerBase.loading');

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

  final _$isFavoriteAtom = Atom(name: '_HuaweiPageControllerBase.isFavorite');

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

  final _$autoValidateAtom =
      Atom(name: '_HuaweiPageControllerBase.autoValidate');

  @override
  bool get autoValidate {
    _$autoValidateAtom.reportRead();
    return super.autoValidate;
  }

  @override
  set autoValidate(bool value) {
    _$autoValidateAtom.reportWrite(value, super.autoValidate, () {
      super.autoValidate = value;
    });
  }

  @override
  String toString() {
    return '''
loading: ${loading},
isFavorite: ${isFavorite},
autoValidate: ${autoValidate}
    ''';
  }
}
