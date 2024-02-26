import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
part 'TextPartial.g.dart';

@JsonSerializable()
@immutable
class TextPartial {
  const TextPartial({
    this.metadata,
    required this.text,
  });

  /// 사용자 메세지
  final String text;

  /// 추가 데이터
  final Map<String, dynamic>? metadata;

  /// Creates a partial text message from a map (decoded JSON).
  factory TextPartial.fromJson(Map<String, dynamic> json) =>
      _$TextPartialFromJson(json);

  /// Converts a partial text message to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$TextPartialToJson(this);
}
