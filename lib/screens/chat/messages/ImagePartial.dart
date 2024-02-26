import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ImagePartial.g.dart';

@JsonSerializable()
@immutable
class ImagePartial {
  const ImagePartial({
    this.height,
    this.metadata,
    required this.name,
    required this.size,
    required this.uri,
    this.width,
  });

  /// 이미지 uri
  final String uri;

  /// 이미지 이름
  final String name;

  /// 이미지 가로
  final double? width;

  /// 이미지 높이
  final double? height;

  /// 이미지 용량
  final num size;

  /// 추가 메타데이터
  final Map<String, dynamic>? metadata;

  /// Creates a partial image message from a map (decoded JSON).
  factory ImagePartial.fromJson(Map<String, dynamic> json) =>
      _$ImagePartialFromJson(json);

  /// Converts a partial image message to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$ImagePartialToJson(this);
}
