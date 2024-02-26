// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['code'] as int?,
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['gender'] as String?,
      json['status'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['total'] as int?,
      json['pages'] as int?,
      json['page'] as int?,
      json['limit'] as int?,
      json['meta'] == null
          ? null
          : UserModel.fromJson(json['meta'] as Map<String, dynamic>),
      json['pagination'] == null
          ? null
          : UserModel.fromJson(json['pagination'] as Map<String, dynamic>),
      (json['data'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'total': instance.total,
      'pages': instance.pages,
      'page': instance.page,
      'limit': instance.limit,
      'meta': instance.meta,
      'pagination': instance.pagination,
      'data': instance.data,
    };
