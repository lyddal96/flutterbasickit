import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kit/screens/chat/ChatMessage.dart';
import 'package:kit/screens/chat/messages/TextPartial.dart';
part 'TextMessage.g.dart';

@JsonSerializable()
@immutable
abstract class TextMessage extends ChatMessage {
  /// Creates a text message.
  const TextMessage._({
    required super.author,
    super.createdAt,
    required super.id,
    super.metadata,
    super.roomId,
    super.showStatus,
    super.status,
    required this.text,
    MessageType? type,
    super.updatedAt,
  }) : super(type: type ?? MessageType.text);

  const factory TextMessage({
    required String author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? roomId,
    bool? showStatus,
    Status? status,
    required String text,
    MessageType? type,
    int? updatedAt,
  }) = _TextMessage;

  /// Creates a text message from a map (decoded JSON).
  factory TextMessage.fromJson(Map<String, dynamic> json) =>
      _$TextMessageFromJson(json);

  /// Creates a full text message from a partial one.
  factory TextMessage.fromPartial({
    required String author,
    int? createdAt,
    required String id,
    required TextPartial partialText,
    String? roomId,
    bool? showStatus,
    Status? status,
    int? updatedAt,
  }) =>
      _TextMessage(
        author: author,
        createdAt: createdAt,
        id: id,
        metadata: partialText.metadata,
        roomId: roomId,
        showStatus: showStatus,
        status: status,
        text: partialText.text,
        type: MessageType.text,
        updatedAt: updatedAt,
      );

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

  /// Converts a text message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$TextMessageToJson(this);
}

/// A utility class to enable better copyWith.
class _TextMessage extends TextMessage {
  const _TextMessage({
    required super.author,
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
      _TextMessage(
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
