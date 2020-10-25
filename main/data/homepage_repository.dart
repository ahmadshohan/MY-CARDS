import 'dart:convert';

import 'package:mycarts/data/models/result.dart';
import 'package:mycarts/data/repository.dart';
import 'package:mycarts/main/data/models/home_page_product.dart';
import 'package:mycarts/main/data/models/slider.dart';
import 'package:dio/dio.dart';
import 'package:mycarts/shared/localization/app_localization.dart';

class HomeRepository extends Repository {
  String _path;

  HomeRepository() {
    _path = '$apiUrl';
  }

  Future<Result<dynamic>> getSliderHomePage() async {
    try {
      final response = await dio.get('${_path}slider');
      if (response.statusCode == 200) {
        final data = response.data;
        return Result(ResultStatus.SUCCESS, data: SliderResult.fromJson(data));
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

  Future<Result<dynamic>> getProductsHomePage() async {
    try {
      final response = await dio.get('${_path}products_home_page');
      if (response.statusCode == 200) {
        final data = response.data;
        return Result(ResultStatus.SUCCESS,
            data: HomePageProductsResult.fromJson(data));
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
  //
  // Future<Result<dynamic>> getBestSongsHomePage(String lang) async {
  //   try {
  //     final langData = jsonEncode({'lang': 'tr'});
  //     final response =
  //         await dio.post('${_path}home_page_best_songs', data: langData);
  //     if (response.statusCode == 200) {
  //       final data = response.data;
  //       return Result(ResultStatus.SUCCESS, data: SongResult.fromJson(data));
  //     } else
  //       return getError(response);
  //   } catch (e) {
  //     print(e);
  //     if (e is DioError)
  //       return getError(e.response);
  //     else
  //       return Result(ResultStatus.FAIL,
  //           errorMessage: AppLocalization.someError);
  //   }
  // }
  //
  // Future<Result<dynamic>> getPlayListHomePage() async {
  //   try {
  //     final response = await dio.get('${_path}home_page_play_list');
  //     if (response.statusCode == 200) {
  //       final data = response.data;
  //       return Result(ResultStatus.SUCCESS, data: jsonDecode(data));
  //     } else
  //       return getError(response);
  //   } catch (e) {
  //     print(e);
  //     if (e is DioError)
  //       return getError(e.response);
  //     else
  //       return Result(ResultStatus.FAIL,
  //           errorMessage: AppLocalization.someError);
  //   }
  // }
}
