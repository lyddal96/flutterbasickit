import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class UserModel {
  int? code;

  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;
  String? created_at;
  String? updated_at;

  int? total;
  int? pages;
  int? page;
  int? limit;

  UserModel? meta;
  UserModel? pagination;
  List<UserModel>? data;

  UserModel(
      this.code,
      this.id,
      this.name,
      this.email,
      this.gender,
      this.status,
      this.created_at,
      this.updated_at,
      this.total,
      this.pages,
      this.page,
      this.limit,
      this.meta,
      this.pagination,
      this.data);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
