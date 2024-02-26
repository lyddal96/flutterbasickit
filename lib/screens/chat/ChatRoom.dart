import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kit/screens/chat/ChatMessage.dart';

part "ChatRoom.g.dart";

enum RoomType { channel, direct, group }

@JsonSerializable()
@immutable
class ChatRoom extends Equatable {
  const ChatRoom._({
    this.createdAt,
    required this.id,
    this.imageUrl,
    this.lastMessages,
    this.metadata,
    this.name,
    required this.type,
    this.updatedAt,
    required this.users,
  });

  // 방 아이디
  final String id;

  // 방 이미지
  final String? imageUrl;

  // 방 이름
  final String? name;

  // 방 생성 일자
  final int? createdAt;

  // 방 수정 일자
  final int? updatedAt;

  // 방 타입
  final RoomType? type;

  // 방 입장 사용자 목록
  final List<String> users;

  // 메타데이터
  final Map<String, dynamic>? metadata;

  // 마지막 메세지
  final List<ChatMessage>? lastMessages;

  const ChatRoom({
    required this.id,
    this.imageUrl,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.type,
    required this.users,
    this.metadata,
    this.lastMessages,
  });

  @override
  List<Object?> get props => [
        createdAt,
        id,
        imageUrl,
        lastMessages,
        metadata,
        name,
        type,
        updatedAt,
        users,
      ];

  // ChatRoom copyWith({
  //   int? createdAt,
  //   String? id,
  //   String? imageUrl,
  //   List<ChatMessage>? lastMessages,
  //   Map<String, dynamic>? metadata,
  //   String? name,
  //   RoomType? type,
  //   int? updatedAt,
  //   List<String>? users,
  // });

  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomToJson(this);
}

/// A utility class to enable better copyWith.
class _ChatRoom extends ChatRoom {
  const _ChatRoom({
    super.createdAt,
    required super.id,
    super.imageUrl,
    super.lastMessages,
    super.metadata,
    super.name,
    required super.type,
    super.updatedAt,
    required super.users,
  }) : super._();

  @override
  ChatRoom copyWith({
    dynamic createdAt = _Unset,
    String? id,
    dynamic imageUrl = _Unset,
    dynamic lastMessages = _Unset,
    dynamic metadata = _Unset,
    dynamic name = _Unset,
    dynamic type = _Unset,
    dynamic updatedAt = _Unset,
    List<String>? users,
  }) =>
      _ChatRoom(
        createdAt: createdAt == _Unset ? this.createdAt : createdAt as int?,
        id: id ?? this.id,
        imageUrl: imageUrl == _Unset ? this.imageUrl : imageUrl as String?,
        lastMessages: lastMessages == _Unset
            ? this.lastMessages
            : lastMessages as List<ChatMessage>?,
        metadata: metadata == _Unset
            ? this.metadata
            : metadata as Map<String, dynamic>?,
        name: name == _Unset ? this.name : name as String?,
        type: type == _Unset ? this.type : type as RoomType?,
        updatedAt: updatedAt == _Unset ? this.updatedAt : updatedAt as int?,
        users: users ?? this.users,
      );
}

class _Unset {}
