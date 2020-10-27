import 'package:flutter/material.dart';
import 'package:mycarts/data/models/result.dart';
import 'package:mycarts/main/settings/profile/data/models/profile.dart';
import 'package:mycarts/main/settings/profile/data/profile_repository.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/services/preferences_service.dart';
import 'package:mobx/mobx.dart';
import 'package:mycarts/shared/widgets/toaster.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();
  ProfileRepository _profileRepository = ProfileRepository();

  Future init() async {
    lang = await _preferencesService.lang;
    AppLocalization.langStream.listen((value) {
      lang = value;
    });
    settingPath = _profileRepository.settingPath;
  }

  @observable
  String settingPath = '';

  @observable
  bool loading = false;

  @observable
  String lang = AppLocalization.defaultLang;

  @observable
  Profile profileData = Profile();

  @action
  Future<dynamic> profile(BuildContext context) async {
    loading = true;
    final result = await _profileRepository.getProfile();
    if (result.state == ResultStatus.FAIL)
      Toaster.error(msg: result.errorMessage);
    else {
      profileData = result.data.data as Profile;
    }
    loading = false;
  }
}
