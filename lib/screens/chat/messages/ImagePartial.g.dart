// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImagePartial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagePartial _$ImagePartialFromJson(Map<String, dynamic> json) => ImagePartial(
      height: (json['height'] as num?)?.toDouble(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      name: json['name'] as String,
      size: json['size'] as num,
      uri: json['uri'] as String,
      width: (json['width'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ImagePartialToJson(ImagePartial instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'name': instance.name,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'metadata': instance.metadata,
    };
