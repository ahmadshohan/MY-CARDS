import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/services/preferences_service.dart';
import 'package:mobx/mobx.dart';

part 'welcome_controller.g.dart';

class WelcomeController = _WelcomeControllerBase with _$WelcomeController;

abstract class _WelcomeControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();

  Future init() async {
    lang = await _preferencesService.lang;
    AppLocalization.langStream.listen((value) {
      lang = value;
    });
  }

  @observable
  bool loading = false;

  @observable
  String lang = AppLocalization.defaultLang;

  @observable
  bool showPassword = false;

  @action
  bool isRtl() => lang == AppLocalization.ar;
}
