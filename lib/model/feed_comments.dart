// To parse this JSON data, do
//
//     final feedComments = feedCommentsFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/model/user.dart';

part 'feed_comments.g.dart';

// FeedComments feedCommentsFromJson(String str) => FeedComments.fromJson(json.decode(str));
//
// String feedCommentsToJson(FeedComments data) => json.encode(data.toJson());
//
// class FeedComments {
//   FeedComments({
//     this.status,
//     this.data,
//   });
//
//   bool status;
//   Data data;
//
//   factory FeedComments.fromJson(Map<String, dynamic> json) => FeedComments(
//     status: json["status"],
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "data": data.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     this.currentPage,
//     this.data,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });
//
//   int currentPage;
//   List<Datum> data;
//   String firstPageUrl;
//   int from;
//   int lastPage;
//   String lastPageUrl;
//   dynamic nextPageUrl;
//   String path;
//   int perPage;
//   dynamic prevPageUrl;
//   int to;
//   int total;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     currentPage: json["current_page"],
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     firstPageUrl: json["first_page_url"],
//     from: json["from"],
//     lastPage: json["last_page"],
//     lastPageUrl: json["last_page_url"],
//     nextPageUrl: json["next_page_url"],
//     path: json["path"],
//     perPage: json["per_page"],
//     prevPageUrl: json["prev_page_url"],
//     to: json["to"],
//     total: json["total"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "current_page": currentPage,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "first_page_url": firstPageUrl,
//     "from": from,
//     "last_page": lastPage,
//     "last_page_url": lastPageUrl,
//     "next_page_url": nextPageUrl,
//     "path": path,
//     "per_page": perPage,
//     "prev_page_url": prevPageUrl,
//     "to": to,
//     "total": total,
//   };
// }

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class FeedComments {
  FeedComments({
    this.id,
    this.comment,
    this.usersId,
    this.isAnonymous,
    this.createdAt,
    this.user,
  });

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "comment")
  String comment;
  @JsonKey(name: "users_id")
  int usersId;
  @JsonKey(name: "is_anonymous")
  String isAnonymous;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "user")
  User user;

  factory FeedComments.fromJson(Map<String, dynamic> json) =>
      _$FeedCommentsFromJson(json);

  Map<String, dynamic> toJson() => _$FeedCommentsToJson(this);
// factory FeedComments.fromJson(Map<String, dynamic> json) => FeedComments(
//       id: json["id"],
//       comment: json["comment"],
//       usersId: json["users_id"],
//       isAnonymous: json["is_anonymous"],
//       createdAt: DateTime.parse(json["created_at"]),
//       user: User.fromJson(json["user"]),
//     );
//
// Map<String, dynamic> toJson() => {
//       "id": id,
//       "comment": comment,
//       "users_id": usersId,
//       "is_anonymous": isAnonymous,
//       "created_at": createdAt.toIso8601String(),
//       "user": user.toJson(),
//     };
}

// class User {
//   User({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.createdAt,
//     this.userImage,
//     this.uploadUrl,
//     this.gender,
//   });
//
//   int id;
//   String firstName;
//   String lastName;
//   DateTime createdAt;
//   String userImage;
//   String uploadUrl;
//   String gender;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"],
//     firstName: json["first_name"],
//     lastName: json["last_name"],
//     createdAt: DateTime.parse(json["created_at"]),
//     userImage: json["user_image"],
//     uploadUrl: json["upload_url"],
//     gender: json["gender"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "first_name": firstName,
//     "last_name": lastName,
//     "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
//     "user_image": userImage,
//     "upload_url": uploadUrl,
//     "gender": gender,
//   };
// }
