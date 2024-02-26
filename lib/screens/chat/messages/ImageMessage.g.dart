// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImageMessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageMessage _$ImageMessageFromJson(Map<String, dynamic> json) => ImageMessage(
      author: json['author'] as String,
      createdAt: json['createdAt'] as int?,
      height: (json['height'] as num?)?.toDouble(),
      id: json['id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      name: json['name'] as String,
      roomId: json['roomId'] as String?,
      showStatus: json['showStatus'] as bool?,
      size: json['size'] as num,
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']),
      type: $enumDecodeNullable(_$MessageTypeEnumMap, json['type']),
      updatedAt: json['updatedAt'] as int?,
      uri: json['uri'] as String,
      width: (json['width'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ImageMessageToJson(ImageMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomId': instance.roomId,
      'author': instance.author,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'showStatus': instance.showStatus,
      'status': _$StatusEnumMap[instance.status],
      'type': _$MessageTypeEnumMap[instance.type]!,
      'metadata': instance.metadata,
      'height': instance.height,
      'name': instance.name,
      'size': instance.size,
      'uri': instance.uri,
      'width': instance.width,
    };

const _$StatusEnumMap = {
  Status.delivered: 'delivered',
  Status.error: 'error',
  Status.seen: 'seen',
  Status.sending: 'sending',
  Status.sent: 'sent',
};

const _$MessageTypeEnumMap = {
  MessageType.custom: 'custom',
  MessageType.image: 'image',
  MessageType.system: 'system',
  MessageType.text: 'text',
  MessageType.unsupported: 'unsupported',
};
