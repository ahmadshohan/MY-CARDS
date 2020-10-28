import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycarts/app_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mycarts/shared/localization/app_localization.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.translationPath,
      fallbackLocale: Locale(AppLocalization.defaultLang),
      child: MyCartsApp()));
}
