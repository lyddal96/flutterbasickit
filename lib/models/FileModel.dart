import 'package:json_annotation/json_annotation.dart';
import 'package:kit/models/BaseModel.dart';
part 'FileModel.g.dart';

@JsonSerializable()
class FileModel extends BaseModel {
  // 파일 경로
  String? file_path;
  // 파일 원본 이름
  String? orig_name;
  // 파일 가로 사이즈
  int? img_width;
  // 파일 세로 사이즈
  int? img_height;

  FileModel();

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileModelToJson(this);
}
