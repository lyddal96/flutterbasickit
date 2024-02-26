import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kit/models/BaseModel.dart';
import 'package:kit/utils/AlertUtils.dart';
import 'package:kit/utils/PrettyDioLogger.dart';

class ApiUtils {
  /// DIO 가져오기
  static Dio getDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(contentType: "application/json");
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  }

  /// API 성공 유무 체크
  static bool isSuccessResponse(BuildContext context, BaseModel baseModel) {
    // 키보드 내림
    FocusManager.instance.primaryFocus?.unfocus();

    // BaseModel response = baseModel as BaseModel;

    if (baseModel.code == "1000") {
      return true;
    } else {
      AlertUtils.showToast(context, "${baseModel.code_msg}");
      return false;
    }
    return false;
  }
}
