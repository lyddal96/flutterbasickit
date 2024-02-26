import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
part 'CustomPartial.g.dart';

@JsonSerializable()
@immutable
class CustomPartial {
  const CustomPartial({
    this.metadata,
  });

  factory CustomPartial.fromJson(Map<String, dynamic> json) =>
      _$CustomPartialFromJson(json);

  final Map<String, dynamic>? metadata;

  Map<String, dynamic> toJson() => _$CustomPartialToJson(this);
}
