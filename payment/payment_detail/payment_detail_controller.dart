import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/services/preferences_service.dart';
import 'package:mobx/mobx.dart';

part 'payment_detail_controller.g.dart';

class PaymentDetailController = _PaymentDetailControllerBase
    with _$PaymentDetailController;

abstract class _PaymentDetailControllerBase with Store {
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

  @action
  bool isRtl() => lang == AppLocalization.ar;
}
