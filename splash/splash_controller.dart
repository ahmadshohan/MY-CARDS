import 'package:mycarts/app_route.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/services/preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mycarts/app_widget.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();

  @observable
  String lang = AppLocalization.defaultLang;

  @action
  Future init(BuildContext context) async {
    lang = await _preferencesService.lang;
    AppLocalization.langStream.listen((value) {
      lang = value;
    });
    setDefaultLang(context, lang);
    if ((await _preferencesService.token)?.isNotEmpty == true)
      Navigator.pushReplacementNamed(context, AppRoute.mainRoute);
    else
      await Future.delayed(Duration(milliseconds: 1000),
          () => Navigator.pushReplacementNamed(context, AppRoute.welcomeRoute));
  }

  @action
  void setDefaultLang(BuildContext context, String lang) {
    MyCartsAppState.setLang(context, lang);
  }
}
