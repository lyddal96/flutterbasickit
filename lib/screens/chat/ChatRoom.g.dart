// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatRoom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) => ChatRoom(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      type: $enumDecodeNullable(_$RoomTypeEnumMap, json['type']),
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      lastMessages: (json['lastMessages'] as List<dynamic>?)
          ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatRoomToJson(ChatRoom instance) => <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'type': _$RoomTypeEnumMap[instance.type],
      'users': instance.users,
      'metadata': instance.metadata,
      'lastMessages': instance.lastMessages,
    };

const _$RoomTypeEnumMap = {
  RoomType.channel: 'channel',
  RoomType.direct: 'direct',
  RoomType.group: 'group',
};
