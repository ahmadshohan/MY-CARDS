// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentDetailController on _PaymentDetailControllerBase, Store {
  final _$loadingAtom = Atom(name: '_PaymentDetailControllerBase.loading');

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

  final _$langAtom = Atom(name: '_PaymentDetailControllerBase.lang');

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

  final _$_PaymentDetailControllerBaseActionController =
      ActionController(name: '_PaymentDetailControllerBase');

  @override
  bool isRtl() {
    final _$actionInfo = _$_PaymentDetailControllerBaseActionController
        .startAction(name: '_PaymentDetailControllerBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_PaymentDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
lang: ${lang}
    ''';
  }
}
