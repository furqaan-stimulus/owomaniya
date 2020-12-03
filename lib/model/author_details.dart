import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/model/roles.dart';
import 'package:owomaniya/model/users.dart';

part 'author_details.g.dart';

@JsonSerializable(
    explicitToJson: true, includeIfNull: true, nullable: true, anyMap: true,)
class AuthorDetails {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'user_id')
  int userId;

  @JsonKey(name: 'user_role_id')
  int userRoleId;

  @JsonKey(name: 'introduction')
  String introduction;

  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'facebook_link')
  String facebookLink;

  @JsonKey(name: 'twitter_link')
  String twitterLink;

  @JsonKey(name: 'website')
  String website;

  @JsonKey(name: 'prefix')
  String prefix;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  @JsonKey(name: 'created_by')
  int createdBy;

  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  @JsonKey(name: 'updated_by')
  int updatedBy;

  @JsonKey(name: 'deleted_at')
  DateTime deletedAt;

  @JsonKey(name: 'user')
  Users user;

  Roles roles;

  AuthorDetails({
    this.id,
    this.userId,
    this.user,
    this.userRoleId,
    this.introduction,
    this.brief,
    this.facebookLink,
    this.twitterLink,
    this.website,
    this.prefix,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.roles,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> map) =>
      _$AuthorDetailsFromJson(map);

  Map<String, dynamic> toJson() => _$AuthorDetailsToJson(this);
}
