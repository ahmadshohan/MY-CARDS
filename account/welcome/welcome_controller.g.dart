// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WelcomeController on _WelcomeControllerBase, Store {
  final _$selectedLangAtom = Atom(name: '_WelcomeControllerBase.selectedLang');

  @override
  String get selectedLang {
    _$selectedLangAtom.reportRead();
    return super.selectedLang;
  }

  @override
  set selectedLang(String value) {
    _$selectedLangAtom.reportWrite(value, super.selectedLang, () {
      super.selectedLang = value;
    });
  }

  final _$loadingAtom = Atom(name: '_WelcomeControllerBase.loading');

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

  final _$langAtom = Atom(name: '_WelcomeControllerBase.lang');

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

  final _$showPasswordAtom = Atom(name: '_WelcomeControllerBase.showPassword');

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

  final _$initAsyncAction = AsyncAction('_WelcomeControllerBase.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_WelcomeControllerBaseActionController =
      ActionController(name: '_WelcomeControllerBase');

  @override
  dynamic changeLangWord() {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.changeLangWord');
    try {
      return super.changeLangWord();
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isRtl() {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedLang: ${selectedLang},
loading: ${loading},
lang: ${lang},
showPassword: ${showPassword}
    ''';
  }
}
