// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaints_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComplaintsController on _ComplaintsControllerrBase, Store {
  final _$loadingAtom = Atom(name: '_ComplaintsControllerrBase.loading');

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

  final _$langAtom = Atom(name: '_ComplaintsControllerrBase.lang');

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

  final _$autoValidateAtom =
      Atom(name: '_ComplaintsControllerrBase.autoValidate');

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
      Atom(name: '_ComplaintsControllerrBase.showPassword');

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

  final _$modelAtom = Atom(name: '_ComplaintsControllerrBase.model');

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

  final _$updateAsyncAction = AsyncAction('_ComplaintsControllerrBase.update');

  @override
  Future update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  final _$_ComplaintsControllerrBaseActionController =
      ActionController(name: '_ComplaintsControllerrBase');

  @override
  bool isRtl() {
    final _$actionInfo = _$_ComplaintsControllerrBaseActionController
        .startAction(name: '_ComplaintsControllerrBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_ComplaintsControllerrBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
lang: ${lang},
autoValidate: ${autoValidate},
showPassword: ${showPassword},
model: ${model}
    ''';
  }
}
