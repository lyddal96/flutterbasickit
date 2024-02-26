// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileModel _$FileModelFromJson(Map<String, dynamic> json) => FileModel()
  ..code = json['code'] as String?
  ..code_msg = json['code_msg'] as String?
  ..message = json['message'] as String?
  ..member_idx = json['member_idx'] as String?
  ..gcm_key = json['gcm_key'] as String?
  ..device_os = json['device_os'] as String?
  ..list_cnt = json['list_cnt'] as int?
  ..page_num = json['page_num'] as int?
  ..total_page = json['total_page'] as int?
  ..file_path = json['file_path'] as String?
  ..orig_name = json['orig_name'] as String?
  ..img_width = json['img_width'] as int?
  ..img_height = json['img_height'] as int?;

Map<String, dynamic> _$FileModelToJson(FileModel instance) => <String, dynamic>{
      'code': instance.code,
      'code_msg': instance.code_msg,
      'message': instance.message,
      'member_idx': instance.member_idx,
      'gcm_key': instance.gcm_key,
      'device_os': instance.device_os,
      'list_cnt': instance.list_cnt,
      'page_num': instance.page_num,
      'total_page': instance.total_page,
      'file_path': instance.file_path,
      'orig_name': instance.orig_name,
      'img_width': instance.img_width,
      'img_height': instance.img_height,
    };
