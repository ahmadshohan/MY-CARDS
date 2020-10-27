// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileControllerBase, Store {
  final _$settingPathAtom = Atom(name: '_ProfileControllerBase.settingPath');

  @override
  String get settingPath {
    _$settingPathAtom.reportRead();
    return super.settingPath;
  }

  @override
  set settingPath(String value) {
    _$settingPathAtom.reportWrite(value, super.settingPath, () {
      super.settingPath = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ProfileControllerBase.loading');

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

  final _$langAtom = Atom(name: '_ProfileControllerBase.lang');

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

  final _$profileDataAtom = Atom(name: '_ProfileControllerBase.profileData');

  @override
  Profile get profileData {
    _$profileDataAtom.reportRead();
    return super.profileData;
  }

  @override
  set profileData(Profile value) {
    _$profileDataAtom.reportWrite(value, super.profileData, () {
      super.profileData = value;
    });
  }

  final _$profileAsyncAction = AsyncAction('_ProfileControllerBase.profile');

  @override
  Future<dynamic> profile(BuildContext context) {
    return _$profileAsyncAction.run(() => super.profile(context));
  }

  @override
  String toString() {
    return '''
settingPath: ${settingPath},
loading: ${loading},
lang: ${lang},
profileData: ${profileData}
    ''';
  }
}
