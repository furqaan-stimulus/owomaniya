import 'package:json_annotation/json_annotation.dart';

part 'user_tags.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)

class UserTags {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  dynamic deletedAt;
  @JsonKey(name: "created_by")
  String createdBy;
  @JsonKey(name: "updated_by")
  String updatedBy;
  @JsonKey(name: "tags_id")
  String tagsId;
  @JsonKey(name: "users_id")
  String usersId;

  UserTags({
    this.id,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.tagsId,
    this.usersId,
  });

  factory UserTags.fromJson(Map<String, dynamic> json) => _$UserTagsFromJson(json);

  Map<String, dynamic> toJson() => _$UserTagsToJson(this);

  // factory UserTag.fromJson(Map<String, dynamic> map) {
  //   return UserTag(
  //     id: map['id'],
  //     createdAt: map['created_at'],
  //     createdBy: map['created_by'],
  //     updatedAt: map['updated_at'],
  //     updatedBy: map['updated_by'],
  //     deletedAt: map['deleted_at'],
  //     tagsId: map['tags_id'],
  //     usersId: map['users_id'],
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['created_at'] = this.createdAt;
  //   data['created_by'] = this.createdBy;
  //   data['updated_at'] = this.updatedAt;
  //   data['updated_by'] = this.updatedBy;
  //   data['deleted_at'] = this.deletedAt;
  //   data['tags_id'] = this.tagsId;
  //   data['users_id'] = this.usersId;
  //   return data;
  // }
}
