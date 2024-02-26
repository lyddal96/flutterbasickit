import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kit/screens/chat/ChatMessage.dart';

part 'SystemMessage.g.dart';

@JsonSerializable()
@immutable
abstract class SystemMessage extends ChatMessage {
  /// Creates a custom message.
  const SystemMessage._({
    super.author = "system",
    super.createdAt,
    required super.id,
    super.metadata,
    super.roomId,
    super.showStatus,
    super.status,
    required this.text,
    MessageType? type,
    super.updatedAt,
  }) : super(type: type ?? MessageType.system);

  const factory SystemMessage({
    String author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? roomId,
    bool? showStatus,
    Status? status,
    required String text,
    MessageType? type,
    int? updatedAt,
  }) = _SystemMessage;

  /// Creates a custom message from a map (decoded JSON).
  factory SystemMessage.fromJson(Map<String, dynamic> json) =>
      _$SystemMessageFromJson(json);

  /// System message content (could be text or translation key).
  final String text;

  /// Equatable props.
  @override
  List<Object?> get props => [
        author,
        createdAt,
        id,
        metadata,
        roomId,
        showStatus,
        status,
        text,
        updatedAt,
      ];

  @override
  ChatMessage copyWith({
    String? author,
    int? createdAt,
    String? id,
    Map<String, dynamic>? metadata,
    String? roomId,
    bool? showStatus,
    Status? status,
    String? text,
    int? updatedAt,
  });

  /// Converts a custom message to the map representation,
  /// encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$SystemMessageToJson(this);
}

/// A utility class to enable better copyWith.
class _SystemMessage extends SystemMessage {
  const _SystemMessage({
    super.author,
    super.createdAt,
    required super.id,
    super.metadata,
    super.roomId,
    super.showStatus,
    super.status,
    required super.text,
    super.type,
    super.updatedAt,
  }) : super._();

  @override
  ChatMessage copyWith({
    String? author,
    dynamic createdAt = _Unset,
    String? id,
    dynamic metadata = _Unset,
    dynamic roomId,
    dynamic showStatus = _Unset,
    dynamic status = _Unset,
    String? text,
    dynamic updatedAt = _Unset,
  }) =>
      _SystemMessage(
        author: author ?? this.author,
        createdAt: createdAt == _Unset ? this.createdAt : createdAt as int?,
        id: id ?? this.id,
        metadata: metadata == _Unset
            ? this.metadata
            : metadata as Map<String, dynamic>?,
        roomId: roomId == _Unset ? this.roomId : roomId as String?,
        showStatus:
            showStatus == _Unset ? this.showStatus : showStatus as bool?,
        status: status == _Unset ? this.status : status as Status?,
        text: text ?? this.text,
        updatedAt: updatedAt == _Unset ? this.updatedAt : updatedAt as int?,
      );
}

class _Unset {}
