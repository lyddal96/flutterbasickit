// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel()
  ..code = json['code'] as String?
  ..code_msg = json['code_msg'] as String?
  ..message = json['message'] as String?
  ..member_idx = json['member_idx'] as String?
  ..gcm_key = json['gcm_key'] as String?
  ..device_os = json['device_os'] as String?
  ..list_cnt = json['list_cnt'] as int?
  ..page_num = json['page_num'] as int?
  ..total_page = json['total_page'] as int?;

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'code': instance.code,
      'code_msg': instance.code_msg,
      'message': instance.message,
      'member_idx': instance.member_idx,
      'gcm_key': instance.gcm_key,
      'device_os': instance.device_os,
      'list_cnt': instance.list_cnt,
      'page_num': instance.page_num,
      'total_page': instance.total_page,
    };
