import 'package:json_annotation/json_annotation.dart';
import 'package:kit/models/BaseModel.dart';
part 'MemberModel.g.dart';

@JsonSerializable()
class MemberModel extends BaseModel {
  String? member_id;
  String? member_pw;

  MemberModel();

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);

  Map<String, dynamic> toJson() => _$MemberModelToJson(this);
}
