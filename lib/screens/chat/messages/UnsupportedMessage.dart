import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kit/screens/chat/ChatMessage.dart';
part "UnsupportedMessage.g.dart";

@JsonSerializable()
@immutable
abstract class UnsupportedMessage extends ChatMessage {
  /// Creates an unsupported message.
  const UnsupportedMessage._({
    required super.author,
    super.createdAt,
    required super.id,
    super.metadata,
    super.roomId,
    super.showStatus,
    super.status,
    MessageType? type,
    super.updatedAt,
  }) : super(type: type ?? MessageType.unsupported);

  const factory UnsupportedMessage({
    required String author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? roomId,
    bool? showStatus,
    Status? status,
    MessageType? type,
    int? updatedAt,
  }) = _UnsupportedMessage;

  /// Creates an unsupported message from a map (decoded JSON).
  factory UnsupportedMessage.fromJson(Map<String, dynamic> json) =>
      _$UnsupportedMessageFromJson(json);

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
    int? updatedAt,
  });

  /// Converts an unsupported message to the map representation,
  /// encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$UnsupportedMessageToJson(this);
}

/// A utility class to enable better copyWith.
class _UnsupportedMessage extends UnsupportedMessage {
  const _UnsupportedMessage({
    required super.author,
    super.createdAt,
    required super.id,
    super.metadata,
    super.roomId,
    super.showStatus,
    super.status,
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
    dynamic updatedAt = _Unset,
  }) =>
      _UnsupportedMessage(
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
        updatedAt: updatedAt == _Unset ? this.updatedAt : updatedAt as int?,
      );
}

class _Unset {}
