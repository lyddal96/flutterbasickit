// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnsupportedMessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsupportedMessage _$UnsupportedMessageFromJson(Map<String, dynamic> json) =>
    UnsupportedMessage(
      author: json['author'] as String,
      createdAt: json['createdAt'] as int?,
      id: json['id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      roomId: json['roomId'] as String?,
      showStatus: json['showStatus'] as bool?,
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']),
      type: $enumDecodeNullable(_$MessageTypeEnumMap, json['type']),
      updatedAt: json['updatedAt'] as int?,
    );

Map<String, dynamic> _$UnsupportedMessageToJson(UnsupportedMessage instance) =>
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
