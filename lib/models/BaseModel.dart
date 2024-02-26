import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kit/main.dart';
part 'BaseModel.g.dart';

@JsonSerializable()
class BaseModel {
  String? code;
  String? code_msg;

  String? message;
  String? member_idx;
  String? gcm_key;
  String? device_os;

  int? list_cnt;
  int? page_num;
  int? total_page;

  BaseModel();

  /// 마지막 페이지 체크
  bool isLastPage() {
    logger.i("총 페이지 : ${page_num} / ${total_page} ");
    if ((total_page ?? 0) > (page_num ?? 0)) {
      return false;
    }
    return true;
  }

  /// 다음 페이지
  int getNextPage() {
    page_num = (page_num ?? 0) + 1;
    return page_num ?? 1;
  }

  /// 페이지 리셋
  void resetPage() {
    this.page_num = 1;
  }

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}
