import 'package:mycarts/shared/constant/payment_method.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/services/preferences_service.dart';
import 'package:mobx/mobx.dart';

part 'payment_method_controller.g.dart';

class PaymentMethodController = _PaymentMethodControllerBase
    with _$PaymentMethodController;

abstract class _PaymentMethodControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();

  Future init() async {
    lang = await _preferencesService.lang;
    AppLocalization.langStream.listen((value) {
      lang = value;
    });
  }

  @observable
  PaymentMethod selectedPaymentMethod = PaymentMethod.LocalBank;

  @observable
  bool loading = false;

  @observable
  String lang = AppLocalization.defaultLang;

  @observable
  bool showPassword = false;

  @action
  bool isRtl() => lang == AppLocalization.ar;

  @action
  void setSelectedPaymentMethodType(PaymentMethod method) {
    selectedPaymentMethod = method;
  }
}
