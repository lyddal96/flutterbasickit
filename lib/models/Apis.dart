import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kit/models/AlarmModel.dart';
import 'package:kit/models/FileModel.dart';
import 'package:kit/models/MemberModel.dart';
import 'package:kit/models/UserModel.dart';
import 'package:retrofit/retrofit.dart';
part 'Apis.g.dart';

class Apis {
  static const String users = '/users';
  static const String member_login = "login_v_1_0_0/member_login";
  static const String file_upload = "common/fileUpload_action";
  static const String alarm_list = "alarm_v_1_0_0/alarm_list";
}

@RestApi(baseUrl: "http://p.api.rocateerdev.co.kr/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.users)
  Future<UserModel> getUsers();

  /// 회원 로그인
  @FormUrlEncoded()
  @POST(Apis.member_login)
  Future<MemberModel> member_login(@Body() Map<String, dynamic> requestBody);

  /// 알림 목록
  @FormUrlEncoded()
  @POST(Apis.alarm_list)
  Future<AlarmModel> alarm_list(@Body() Map<String, dynamic> requestBody);

  /// 파일 업로드
  @MultiPart()
  @POST(Apis.file_upload)
  Future<FileModel> file_upload(@Part() File file);
}
