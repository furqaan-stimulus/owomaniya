import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/prefix.dart';

part 'user_author_detail.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class UserAuthorDetail {
  UserAuthorDetail({
    this.id,
    this.usersId,
    this.userRoleId,
    this.introduction,
    this.brief,
    this.facebookLink,
    this.twitterLink,
    this.website,
    this.prefix,
    this.updatedAt,
  });

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "users_id")
  int usersId;
  @JsonKey(name: "user_role_id")
  int userRoleId;
  @JsonKey(name: "introduction")
  String introduction;
  @JsonKey(name: "brief")
  String brief;
  @JsonKey(name: "facebook_link")
  String facebookLink;
  @JsonKey(name: "twitter_link")
  String twitterLink;
  @JsonKey(name: "website")
  String website;
  @JsonKey(name: "prefix")
  Prefix prefix;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  factory UserAuthorDetail.fromJson(Map<String, dynamic> json) => _$UserAuthorDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthorDetailToJson(this);

// factory UserAuthorDetail.fromJson(Map<String, dynamic> json) => UserAuthorDetail(
//       id: json["id"],
//       usersId: json["users_id"],
//       userRoleId: json["user_role_id"],
//       introduction: json["introduction"],
//       brief: json["brief"] == null ? null : json["brief"],
//       facebookLink: json["facebook_link"] == null ? null : json["facebook_link"],
//       twitterLink: json["twitter_link"] == null ? null : json["twitter_link"],
//       website: json["website"] == null ? null : json["website"],
//       prefix: prefixValues.map[json["prefix"]],
//       updatedAt: DateTime.parse(json["updated_at"]),
//     );
//
// Map<String, dynamic> toJson() => {
//       "id": id,
//       "users_id": usersId,
//       "user_role_id": userRoleId,
//       "introduction": introduction,
//       "brief": brief == null ? null : brief,
//       "facebook_link": facebookLink == null ? null : facebookLink,
//       "twitter_link": twitterLink == null ? null : twitterLink,
//       "website": website == null ? null : website,
//       "prefix": prefixValues.reverse[prefix],
//       "updated_at":
//           "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
//     };
}
