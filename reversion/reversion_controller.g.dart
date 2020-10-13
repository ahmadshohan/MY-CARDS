// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reversion_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReversionPageController on _ReversionPageControllerBase, Store {
  final _$reversionItemAtom =
      Atom(name: '_ReversionPageControllerBase.reversionItem');

  @override
  String get reversionItem {
    _$reversionItemAtom.reportRead();
    return super.reversionItem;
  }

  @override
  set reversionItem(String value) {
    _$reversionItemAtom.reportWrite(value, super.reversionItem, () {
      super.reversionItem = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ReversionPageControllerBase.loading');

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

  final _$langAtom = Atom(name: '_ReversionPageControllerBase.lang');

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

  final _$pictureFileAtom =
      Atom(name: '_ReversionPageControllerBase.pictureFile');

  @override
  File get pictureFile {
    _$pictureFileAtom.reportRead();
    return super.pictureFile;
  }

  @override
  set pictureFile(File value) {
    _$pictureFileAtom.reportWrite(value, super.pictureFile, () {
      super.pictureFile = value;
    });
  }

  final _$autoValidateAtom =
      Atom(name: '_ReversionPageControllerBase.autoValidate');

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

  final _$showPasswordAtom =
      Atom(name: '_ReversionPageControllerBase.showPassword');

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

  final _$modelAtom = Atom(name: '_ReversionPageControllerBase.model');

  @override
  ProfileModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ProfileModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$updateAsyncAction =
      AsyncAction('_ReversionPageControllerBase.update');

  @override
  Future update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  final _$_ReversionPageControllerBaseActionController =
      ActionController(name: '_ReversionPageControllerBase');

  @override
  bool isRtl() {
    final _$actionInfo = _$_ReversionPageControllerBaseActionController
        .startAction(name: '_ReversionPageControllerBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_ReversionPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reversionItemChange(String selectedItem) {
    final _$actionInfo = _$_ReversionPageControllerBaseActionController
        .startAction(name: '_ReversionPageControllerBase.reversionItemChange');
    try {
      return super.reversionItemChange(selectedItem);
    } finally {
      _$_ReversionPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reversionItem: ${reversionItem},
loading: ${loading},
lang: ${lang},
pictureFile: ${pictureFile},
autoValidate: ${autoValidate},
showPassword: ${showPassword},
model: ${model}
    ''';
  }
}
