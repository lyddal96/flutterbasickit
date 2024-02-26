// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AlarmModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlarmModel _$AlarmModelFromJson(Map<String, dynamic> json) => AlarmModel()
  ..code = json['code'] as String?
  ..code_msg = json['code_msg'] as String?
  ..message = json['message'] as String?
  ..list_cnt = json['list_cnt'] as int?
  ..page_num = json['page_num'] as int?
  ..total_page = json['total_page'] as int?
  ..alarm_idx = json['alarm_idx'] as String?
  ..msg = json['msg'] as String?
  ..read_yn = json['read_yn'] as String?
  ..del_yn = json['del_yn'] as String?
  ..ins_date = json['ins_date'] as String?
  ..data = json['data'] == null
      ? null
      : AlarmModel.fromJson(json['data'] as Map<String, dynamic>)
  ..member_idx = json['member_idx'] as String?
  ..corp_idx = json['corp_idx'] as String?
  ..proposal_idx = json['proposal_idx'] as String?
  ..qa_idx = json['qa_idx'] as String?
  ..exposition_idx = json['exposition_idx'] as String?
  ..gcm_key = json['gcm_key'] as String?
  ..device_os = json['device_os'] as String?
  ..title = json['title'] as String?
  ..alarm_yn = json['alarm_yn'] as String?
  ..data_array = (json['data_array'] as List<dynamic>?)
      ?.map((e) => AlarmModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$AlarmModelToJson(AlarmModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'code_msg': instance.code_msg,
      'message': instance.message,
      'list_cnt': instance.list_cnt,
      'page_num': instance.page_num,
      'total_page': instance.total_page,
      'alarm_idx': instance.alarm_idx,
      'msg': instance.msg,
      'read_yn': instance.read_yn,
      'del_yn': instance.del_yn,
      'ins_date': instance.ins_date,
      'data': instance.data,
      'member_idx': instance.member_idx,
      'corp_idx': instance.corp_idx,
      'proposal_idx': instance.proposal_idx,
      'qa_idx': instance.qa_idx,
      'exposition_idx': instance.exposition_idx,
      'gcm_key': instance.gcm_key,
      'device_os': instance.device_os,
      'title': instance.title,
      'alarm_yn': instance.alarm_yn,
      'data_array': instance.data_array,
    };
