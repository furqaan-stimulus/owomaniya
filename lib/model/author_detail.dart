import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/model/user.dart';


part 'author_detail.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class AuthorDetail {
  AuthorDetail({
    this.id,
    this.feedsId,
    this.usersId,
    this.isPrimary,
    this.updatedAt,
    this.user,
  });

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "feeds_id")
  int feedsId;
  @JsonKey(name: "users_id")
  int usersId;
  @JsonKey(name: "is_primary")
  String isPrimary;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "user")
  User user;

  factory AuthorDetail.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailToJson(this);
// factory DetailsAuthorDetail.fromJson(Map<String, dynamic> json) => DetailsAuthorDetail(
//       id: json["id"] == null ? null : json["id"],
//       feedsId: json["feeds_id"] == null ? null : json["feeds_id"],
//       usersId: json["users_id"] == null ? null : json["users_id"],
//       isPrimary: json["is_primary"] == null ? null : json["is_primary"],
//       updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//       user: User.fromJson(json["user"]),
//     );
//
// Map<String, dynamic> toJson() => {
//       "id": id == null ? null : id,
//       "feeds_id": feedsId == null ? null : feedsId,
//       "users_id": usersId == null ? null : usersId,
//       "is_primary": isPrimary == null ? null : isPrimary,
//       "updated_at": updatedAt == null
//           ? null
//           : "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
//       "user": user.toJson(),
//     };
}
