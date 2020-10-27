import 'dart:convert';

import 'package:country_code_picker/country_code.dart';
import 'package:mycarts/account/data/account_repository.dart';
import 'package:mycarts/account/data/models/city.dart';
import 'package:mycarts/account/data/models/login.dart';
import 'package:mycarts/account/data/models/register.dart';
import 'package:mycarts/app_route.dart';
import 'package:mycarts/data/models/result.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/services/preferences_service.dart';
import 'package:mycarts/shared/widgets/toaster.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();
  AccountRepository _accountRepository = AccountRepository();

  Future init() async {
    lang = await _preferencesService.lang;
    autoValidate = false;
    AppLocalization.langStream.listen((value) {
      lang = value;
    });
  }

  @observable
  List<City> cityData = List();

  @observable
  bool loading = false;

  @observable
  bool autoValidate = false;

  @observable
  String lang = AppLocalization.defaultLang;

  @observable
  String city = 'كركوك';

  @observable
  String accountType = 'زبون';

  @observable
  bool showPassword = false;

  @observable
  RegisterModel model = RegisterModel();

  @action
  bool isRtl() => lang == AppLocalization.ar;

  @action
  void selectedCity(String selectedCity) {
    city = selectedCity;
  }

  @action
  void selectedAccountType(String selectedType) {
    accountType = selectedType;
    model.role = selectedType;
  }

  @action
  void changeViewPassword() {
    showPassword = !showPassword;
  }

  @action
  String checkFullName() {
    if (model.fullName.isEmpty) return AppLocalization.userNameRequired;
    if (model.fullName.length < 4)
      return AppLocalization.userNameNotValid;
    else
      return null;
  }

  @action
  String checkEmail() {
    if (model.email.isEmpty)
      return AppLocalization.emailRequired;
    else if (EmailValidator.validate(model.email))
      return null;
    else
      return AppLocalization.emailNotValid;
  }

  @action
  String checkPassword() {
    if (model.password.isEmpty) return AppLocalization.passwordRequired;
    if (model.password.length < 6 || model.password.length > 30)
      return AppLocalization.passwordNotValid;
    else
      return null;
  }

  @action
  String checkMatchPassword() {
    if (model.password.isEmpty) return AppLocalization.passwordRequired;
    if (model.password != model.passwordConfirm)
      return AppLocalization.notMatchPassword;
    else
      return null;
  }

  @action
  String checkPhoneNumber() {
    if (model.phoneNumber.isEmpty) return AppLocalization.phoneNumberRequired;
    if (model.phoneNumber.length <= 9)
      return AppLocalization.phoneNumberNotValid;
    else {
      model.fullPhoneNumber = model.countryCode + model.phoneNumber;
      return null;
    }
  }

  @action
  onCountryChange(CountryCode countryCode) {
    model.countryCode = countryCode.toString();
  }

  @action
  register(BuildContext context) async {
    loading = true;
    final result = await _accountRepository.register(model);
    if (result.state == ResultStatus.FAIL)
      Toaster.error(msg: result.errorMessage);
    else {
      final data = result.data as LoginResult;
      _preferencesService.token = data.response.token;
      // var a = await _preferencesService.token;
      _preferencesService.user = jsonEncode(data.user);
      // var b = User.fromJson(jsonDecode(await _preferencesService.user));
      Navigator.pushReplacementNamed(context, AppRoute.mainRoute);
    }
    loading = false;
  }

  @action
  Future<List<City>> getCitys(BuildContext context) async {
    loading = true;
    final result = await _accountRepository.getAllCity();
    if (result.state == ResultStatus.FAIL)
      Toaster.error(msg: result.errorMessage);
    else {
      cityData = result.data.data as List<City>;
    }
    loading = false;
  }

  @action
  logout(BuildContext context) async {
    loading = true;
    final result = await _accountRepository.logout();
    if (result.state == ResultStatus.FAIL)
      Toaster.error(msg: result.errorMessage);
    else {
      _preferencesService.user = null;
      _preferencesService.token = null;
      Navigator.of(context).pushReplacementNamed(AppRoute.welcomeRoute);
    }
    loading = false;
  }
}
