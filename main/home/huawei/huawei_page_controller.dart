import 'package:mycarts/shared/services/preferences_service.dart';
import 'package:mobx/mobx.dart';

part 'huawei_page_controller.g.dart';

class HuaweiPageController = _HuaweiPageControllerBase
    with _$HuaweiPageController;

abstract class _HuaweiPageControllerBase with Store {
  PreferencesService _preferencesService = PreferencesService();

  @observable
  bool loading = false;

  @observable
  bool isFavorite = false;

  @observable
  bool autoValidate = false;
}
