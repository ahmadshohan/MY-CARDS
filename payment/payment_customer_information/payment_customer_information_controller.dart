import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/services/preferences_service.dart';
import 'package:mobx/mobx.dart';

part 'payment_customer_information_controller.g.dart';

class PaymentCustomerInformationController = _PaymentCustomerInformationControllerBase
    with _$PaymentCustomerInformationController;

abstract class _PaymentCustomerInformationControllerBase with Store {
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
