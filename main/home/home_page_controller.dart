import 'package:mycarts/data/models/result.dart';
import 'package:mycarts/main/data/homepage_repository.dart';
import 'package:mycarts/main/data/models/home_page_product.dart';
import 'package:mycarts/main/data/models/slider.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/services/preferences_service.dart';
import 'package:mobx/mobx.dart';
import 'package:mycarts/shared/widgets/toaster.dart';

part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();
  HomeRepository _homeRepository = HomeRepository();

  @observable
  List<Slider> sliderData = List();

  @observable
  List<Category> homePageCategoryList = List();

  @observable
  List<ProductModel> homePageGamesProductsList = List();

  @observable
  bool loading = false;

  @observable
  bool isFavorite = false;

  @action
  Future<List<Slider>> sliderHomePage() async {
    loading = true;
    final result = await _homeRepository.getSliderHomePage();
    if (result.state == ResultStatus.FAIL) {
      Toaster.error(msg: AppLocalization.someError);
    } else {
      final data = result.data;
      sliderData = data.data as List<Slider>;
    }
    loading = false;
  }

  @action
  Future<List<ProductModel>> productsHomePage() async {
    loading = true;
    final result = await _homeRepository.getProductsHomePage();
    if (result.state == ResultStatus.FAIL) {
      Toaster.error(msg: AppLocalization.someError);
    } else {
      final data = result.data;
      homePageCategoryList = data.data as List<Category>;
      homePageGamesProductsList =
          data.data[0].productsHomePage as List<ProductModel>;
    }
    loading = false;
  }
  //
  // @action
  // Future<List<Song>> bestSongsHomePage() async {
  //   // loading = true;
  //   final result = await _musicRepository.getBestSongsHomePage(lang);
  //   if (result.state == ResultStatus.FAIL) {
  //     Toaster.error(msg: AppLocalization.someError);
  //   } else {
  //     final data = result.data;
  //     bestSongsData = data.data as List<Song>;
  //   }
  //   loading = false;
  // }
}
