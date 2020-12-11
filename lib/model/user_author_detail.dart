import 'package:owomaniya/Enums/prefix.dart';

class UserAuthordetail {
  UserAuthordetail({
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

  int id;
  int usersId;
  int userRoleId;
  String introduction;
  String brief;
  String facebookLink;
  String twitterLink;
  String website;
  Prefix prefix;
  DateTime updatedAt;

  factory UserAuthordetail.fromJson(Map<String, dynamic> json) => UserAuthordetail(
        id: json["id"],
        usersId: json["users_id"],
        userRoleId: json["user_role_id"],
        introduction: json["introduction"],
        brief: json["brief"] == null ? null : json["brief"],
        facebookLink: json["facebook_link"] == null ? null : json["facebook_link"],
        twitterLink: json["twitter_link"] == null ? null : json["twitter_link"],
        website: json["website"] == null ? null : json["website"],
        prefix: prefixValues.map[json["prefix"]],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "user_role_id": userRoleId,
        "introduction": introduction,
        "brief": brief == null ? null : brief,
        "facebook_link": facebookLink == null ? null : facebookLink,
        "twitter_link": twitterLink == null ? null : twitterLink,
        "website": website == null ? null : website,
        "prefix": prefixValues.reverse[prefix],
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
      };
}
