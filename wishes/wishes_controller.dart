import 'package:mycarts/data/models/result.dart';
import 'package:mycarts/main/settings/profile/edit_profile/data/models/profile.dart';
import 'package:mycarts/main/settings/profile/edit_profile/data/profile_repository.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/services/preferences_service.dart';
import 'package:mycarts/shared/widgets/toaster.dart';
import 'package:mobx/mobx.dart';

part 'wishes_controller.g.dart';

class WishesController = _WishesControllerBase with _$WishesController;

abstract class _WishesControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();
  ProfileRepository _profileRepository = ProfileRepository();

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
  bool autoValidate = false;

  @observable
  bool showPassword = false;

  @observable
  ProfileModel model = ProfileModel();

  @action
  bool isRtl() => lang == AppLocalization.ar;

  @action
  update() async {
    loading = true;
    final result = await _profileRepository.update(model);
    if (result.state == ResultStatus.FAIL)
      Toaster.error(msg: result.errorMessage);
    else {
      final data = result.data;
    }
    loading = false;
  }
}
