import 'package:mycarts/data/models/result.dart';
import 'package:mycarts/data/repository.dart';
import 'package:dio/dio.dart';
import 'package:mycarts/main/settings/profile/data/models/profile.dart';
import 'package:mycarts/shared/localization/app_localization.dart';

class ProfileRepository extends Repository {
  String _path;
  String settingPath;

  ProfileRepository() {
    _path = '$apiUrl';
    settingPath = '$settingUrl';
  }

  Future<Result<dynamic>> getProfile() async {
    try {
      final response = await dio.get('${_path}profile');
      if (response.statusCode == 200) {
        final data = response.data;
        return Result(ResultStatus.SUCCESS, data: ProfileResult.fromJson(data));
      } else
        return getError(response);
    } catch (e) {
      print(e);
      if (e is DioError)
        return getError(e.response);
      else
        return Result(ResultStatus.FAIL,
            errorMessage: AppLocalization.someError);
    }
  }

  logout() async {
    try {
      final response = await dio.post('${_path}log_out');
      if (response.statusCode == 200) {
        return Result(ResultStatus.SUCCESS);
      } else {
        return getError(response);
      }
    } catch (e) {
      print(e);
      if (e is DioError)
        return getError(e.response);
      else
        return Result(ResultStatus.FAIL,
            errorMessage: AppLocalization.someError);
    }
  }
}
