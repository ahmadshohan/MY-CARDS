// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rateus_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RateUsController on _RateUsControllerBase, Store {
  final _$ratingAtom = Atom(name: '_RateUsControllerBase.rating');

  @override
  double get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(double value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  final _$starCountAtom = Atom(name: '_RateUsControllerBase.starCount');

  @override
  int get starCount {
    _$starCountAtom.reportRead();
    return super.starCount;
  }

  @override
  set starCount(int value) {
    _$starCountAtom.reportWrite(value, super.starCount, () {
      super.starCount = value;
    });
  }

  final _$loadingAtom = Atom(name: '_RateUsControllerBase.loading');

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

  final _$langAtom = Atom(name: '_RateUsControllerBase.lang');

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

  final _$pictureFileAtom = Atom(name: '_RateUsControllerBase.pictureFile');

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

  final _$autoValidateAtom = Atom(name: '_RateUsControllerBase.autoValidate');

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

  final _$showPasswordAtom = Atom(name: '_RateUsControllerBase.showPassword');

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

  final _$modelAtom = Atom(name: '_RateUsControllerBase.model');

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

  final _$updateAsyncAction = AsyncAction('_RateUsControllerBase.update');

  @override
  Future update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  final _$_RateUsControllerBaseActionController =
      ActionController(name: '_RateUsControllerBase');

  @override
  bool isRtl() {
    final _$actionInfo = _$_RateUsControllerBaseActionController.startAction(
        name: '_RateUsControllerBase.isRtl');
    try {
      return super.isRtl();
    } finally {
      _$_RateUsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateRating(dynamic newRating) {
    final _$actionInfo = _$_RateUsControllerBaseActionController.startAction(
        name: '_RateUsControllerBase.updateRating');
    try {
      return super.updateRating(newRating);
    } finally {
      _$_RateUsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rating: ${rating},
starCount: ${starCount},
loading: ${loading},
lang: ${lang},
pictureFile: ${pictureFile},
autoValidate: ${autoValidate},
showPassword: ${showPassword},
model: ${model}
    ''';
  }
}
