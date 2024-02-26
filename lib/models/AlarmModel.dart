import 'package:json_annotation/json_annotation.dart';
import 'package:kit/models/BaseModel.dart';
part 'AlarmModel.g.dart';

@JsonSerializable()
class AlarmModel extends BaseModel {
  // 알림 인덱스
  String? alarm_idx;
  // 알림 메세지
  String? msg;
  // 알림 읽음 여부 Y - 읽음, N - 읽지 않음
  String? read_yn;
  // 알림 삭제 여부 Y - 삭제, N - 삭제 아님
  String? del_yn;
  // 알림 날짜
  String? ins_date;
  // 알림 데이터
  AlarmModel? data;

  // 알림 데이터에 있는 항목 - 변경될 수 있음.
  String? member_idx;
  String? corp_idx;
  String? proposal_idx;
  String? qa_idx;
  String? exposition_idx;
  String? gcm_key;
  String? device_os;
  String? title;
  String? alarm_yn;

  List<AlarmModel>? data_array;

  AlarmModel();

  factory AlarmModel.fromJson(Map<String, dynamic> json) =>
      _$AlarmModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlarmModelToJson(this);
}
