import 'package:mycarts/main/data/models/slider.dart';
import 'package:mycarts/shared/services/preferences_service.dart';
import 'package:mobx/mobx.dart';

part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();

  @observable
  List<Slider> sliderData = List();

  @observable
  bool loading = false;

  @observable
  bool isFavorite = false;

  @observable
  bool autoValidate = false;

  // @action
  // Future<List<Slider>> sliderHomePage() async {
  //   // loading = true;
  //   final result = await _musicRepository.getSliderHomePage(lang);
  //   if (result.state == ResultStatus.FAIL) {
  //     Toaster.error(msg: AppLocalization.someError);
  //   } else {
  //     final data = result.data;
  //     sliderData = data.data as List<Slider>;
  //   }
  //   loading = false;
  // }

  // @action
  // Future<List<Album>> lastAlbumsHomePage() async {
  //   // loading = true;
  //   final result = await _musicRepository.getLastAlbumsHomePage(lang);
  //   if (result.state == ResultStatus.FAIL) {
  //     Toaster.error(msg: AppLocalization.someError);
  //   } else {
  //     final data = result.data;
  //     lastAlbumsData = data.data as List<Album>;
  //   }
  //   loading = false;
  // }
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
  //
  // @action
  // dynamic playListHomePage() async {
  //   loading = true;
  //   final result = await _musicRepository.getPlayListHomePage();
  //   if (result.state == ResultStatus.FAIL)
  //     Toaster.error(msg: AppLocalization.someError);
  //   else {
  //     final data = result.data;
  //     return data;
  //   }
  //   loading = false;
  // }
}
