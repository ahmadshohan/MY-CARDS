// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentMethodController on _PaymentMethodControllerBase, Store {
  final _$selectedPaymentMethodAtom =
      Atom(name: '_PaymentMethodControllerBase.selectedPaymentMethod');

  @override
  PaymentMethod get selectedPaymentMethod {
    _$selectedPaymentMethodAtom.reportRead();
    return super.selectedPaymentMethod;
  }

  @override
  set selectedPaymentMethod(PaymentMethod value) {
    _$selectedPaymentMethodAtom.reportWrite(value, super.selectedPaymentMethod,
        () {
      super.selectedPaymentMethod = value;
    });
  }

  final _$loadingAtom = Atom(name: '_PaymentMethodControllerBase.loading');

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

  final _$langAtom = Atom(name: '_PaymentMethodControllerBase.lang');

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

  final _$showPasswordAtom =
      Atom(name: '_PaymentMethodControllerBase.showPassword');

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  final _$_PaymentMethodControllerBaseActionController =
      ActionController(name: '_PaymentMethodControllerBase');

  @override
  bool isRtl() {
    final _$actionInfo = _$_PaymentMethodControllerBaseActionController
        .startAction(name: '_PaymentMethodControllerBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_PaymentMethodControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedPaymentMethodType(PaymentMethod method) {
    final _$actionInfo =
        _$_PaymentMethodControllerBaseActionController.startAction(
            name: '_PaymentMethodControllerBase.setSelectedPaymentMethodType');
    try {
      return super.setSelectedPaymentMethodType(method);
    } finally {
      _$_PaymentMethodControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedPaymentMethod: ${selectedPaymentMethod},
loading: ${loading},
lang: ${lang},
showPassword: ${showPassword}
    ''';
  }
}
