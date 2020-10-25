// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageController on _HomePageControllerBase, Store {
  final _$sliderDataAtom = Atom(name: '_HomePageControllerBase.sliderData');

  @override
  List<Slider> get sliderData {
    _$sliderDataAtom.reportRead();
    return super.sliderData;
  }

  @override
  set sliderData(List<Slider> value) {
    _$sliderDataAtom.reportWrite(value, super.sliderData, () {
      super.sliderData = value;
    });
  }

  final _$homePageCategoryListAtom =
      Atom(name: '_HomePageControllerBase.homePageCategoryList');

  @override
  List<Category> get homePageCategoryList {
    _$homePageCategoryListAtom.reportRead();
    return super.homePageCategoryList;
  }

  @override
  set homePageCategoryList(List<Category> value) {
    _$homePageCategoryListAtom.reportWrite(value, super.homePageCategoryList,
        () {
      super.homePageCategoryList = value;
    });
  }

  final _$homePageGamesProductsListAtom =
      Atom(name: '_HomePageControllerBase.homePageGamesProductsList');

  @override
  List<ProductModel> get homePageGamesProductsList {
    _$homePageGamesProductsListAtom.reportRead();
    return super.homePageGamesProductsList;
  }

  @override
  set homePageGamesProductsList(List<ProductModel> value) {
    _$homePageGamesProductsListAtom
        .reportWrite(value, super.homePageGamesProductsList, () {
      super.homePageGamesProductsList = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomePageControllerBase.loading');

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

  final _$isFavoriteAtom = Atom(name: '_HomePageControllerBase.isFavorite');

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

  final _$sliderHomePageAsyncAction =
      AsyncAction('_HomePageControllerBase.sliderHomePage');

  @override
  Future<List<Slider>> sliderHomePage() {
    return _$sliderHomePageAsyncAction.run(() => super.sliderHomePage());
  }

  final _$productsHomePageAsyncAction =
      AsyncAction('_HomePageControllerBase.productsHomePage');

  @override
  Future<List<ProductModel>> productsHomePage() {
    return _$productsHomePageAsyncAction.run(() => super.productsHomePage());
  }

  @override
  String toString() {
    return '''
sliderData: ${sliderData},
homePageCategoryList: ${homePageCategoryList},
homePageGamesProductsList: ${homePageGamesProductsList},
loading: ${loading},
isFavorite: ${isFavorite}
    ''';
  }
}
