import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:kit/screens/chat/messages/CustomMessage.dart';
import 'package:kit/screens/chat/messages/ImageMessage.dart';
import 'package:kit/screens/chat/messages/SystemMessage.dart';
import 'package:kit/screens/chat/messages/TextMessage.dart';
import 'package:kit/screens/chat/messages/UnsupportedMessage.dart';

/// All possible message types.
enum MessageType {
  custom,
  image,
  system,
  text,
  unsupported,
}

/// All possible statuses message can have.
enum Status { delivered, error, seen, sending, sent }

@immutable
abstract class ChatMessage extends Equatable {
  const ChatMessage({
    required this.id,
    this.roomId,
    required this.author,
    this.createdAt,
    this.updatedAt,
    this.showStatus,
    this.metadata,
    this.status,
    this.text,
    required this.type,
  });

  // 메세지 아이디
  final String id;

  // 방 아이디
  final String? roomId;

  // 메세지 발송자
  final String author;

  // 메세지
  final String? text;

  // 메세지 생성일자
  final int? createdAt;

  // 메세지 수정일자
  final int? updatedAt;

  // 메세지 보여질 것인지 체크
  final bool? showStatus;

  /// 메세지 상태
  final Status? status;

  // 메세지 타입
  final MessageType type;

  // 추가 정보
  final Map<String, dynamic>? metadata;

  /// Creates a copy of the message with an updated data.
  ChatMessage copyWith({
    String? author,
    int? createdAt,
    String? id,
    Map<String, dynamic>? metadata,
    String? roomId,
    bool? showStatus,
    Status? status,
    int? updatedAt,
  });

  /// Creates a particular message from a map (decoded JSON).
  /// Type is determined by the `type` field.
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    final type = MessageType.values.firstWhere(
      (e) => e.name == json['type'],
      orElse: () => MessageType.unsupported,
    );

    switch (type) {
      case MessageType.custom:
        return CustomMessage.fromJson(json);
      case MessageType.image:
        return ImageMessage.fromJson(json);
      case MessageType.system:
        return SystemMessage.fromJson(json);
      case MessageType.text:
        return TextMessage.fromJson(json);
      case MessageType.unsupported:
        return UnsupportedMessage.fromJson(json);
    }
  }

  /// Converts a particular message to the map representation, serializable to JSON.
  Map<String, dynamic> toJson();
}
