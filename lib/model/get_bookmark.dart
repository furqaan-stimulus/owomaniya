import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/model/feed.dart';

part 'get_bookmark.g.dart';

// GetBookmark getBookmarkFromJson(String str) => GetBookmark.fromJson(json.decode(str));
//
// String getBookmarkToJson(GetBookmark data) => json.encode(data.toJson());

// class GetBookmark {
//   GetBookmark({
//     this.status,
//     this.data,
//   });
//
//   bool status;
//   List<Datum> data;
//
//   factory GetBookmark.fromJson(Map<String, dynamic> json) => GetBookmark(
//     status: json["status"],
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class GetBookmark {
  GetBookmark({
    this.id,
    this.usersId,
    this.feedsId,
    this.updatedAt,
    this.feed,
  });

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "users_id")
  int usersId;
  @JsonKey(name: "feeds_id")
  int feedsId;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "feed")
  Feed feed;

  factory GetBookmark.fromJson(Map<String, dynamic> json) => _$GetBookmarkFromJson(json);

  Map<String, dynamic> toJson() => _$GetBookmarkToJson(this);

// factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//   id: json["id"],
//   usersId: json["users_id"],
//   feedsId: json["feeds_id"],
//   updatedAt: DateTime.parse(json["updated_at"]),
//   feed: Feed.fromJson(json["feed"]),
// );
//
// Map<String, dynamic> toJson() => {
//   "id": id,
//   "users_id": usersId,
//   "feeds_id": feedsId,
//   "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
//   "feed": feed.toJson(),
// };
}

// class Feed {
//   Feed({
//     this.id,
//     this.feedUrl,
//     this.feedTitle,
//     this.feedType,
//     this.feedDate,
//     this.feedDetail,
//     this.feedLikeCnt,
//     this.feedCommentCnt,
//     this.feedtypekey,
//     this.bookmarked,
//     this.liked,
//     this.attending,
//     this.relate,
//     this.paymentdone,
//     this.categoryMapping,
//     this.media,
//     this.feedqueryanswered,
//     this.feedevent,
//   });
//
//   int id;
//   String feedUrl;
//   String feedTitle;
//   String feedType;
//   DateTime feedDate;
//   String feedDetail;
//   int feedLikeCnt;
//   int feedCommentCnt;
//   String feedtypekey;
//   bool bookmarked;
//   bool liked;
//   bool attending;
//   bool relate;
//   String paymentdone;
//   List<CategoryMapping> categoryMapping;
//   List<Media> media;
//   List<Feedqueryanswered> feedqueryanswered;
//   dynamic feedevent;
//
//   factory Feed.fromJson(Map<String, dynamic> json) => Feed(
//     id: json["id"],
//     feedUrl: json["feed_url"],
//     feedTitle: json["feed_title"],
//     feedType: json["feed_type"],
//     feedDate: DateTime.parse(json["feed_date"]),
//     feedDetail: json["feed_detail"],
//     feedLikeCnt: json["feed_like_cnt"],
//     feedCommentCnt: json["feed_comment_cnt"],
//     feedtypekey: json["feedtypekey"],
//     bookmarked: json["bookmarked"],
//     liked: json["liked"],
//     attending: json["attending"],
//     relate: json["relate"],
//     paymentdone: json["paymentdone"],
//     categoryMapping: List<CategoryMapping>.from(json["category_mapping"].map((x) => CategoryMapping.fromJson(x))),
//     media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
//     feedqueryanswered: List<Feedqueryanswered>.from(json["feedqueryanswered"].map((x) => Feedqueryanswered.fromJson(x))),
//     feedevent: json["feedevent"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "feed_url": feedUrl,
//     "feed_title": feedTitle,
//     "feed_type": feedType,
//     "feed_date": feedDate.toIso8601String(),
//     "feed_detail": feedDetail,
//     "feed_like_cnt": feedLikeCnt,
//     "feed_comment_cnt": feedCommentCnt,
//     "feedtypekey": feedtypekey,
//     "bookmarked": bookmarked,
//     "liked": liked,
//     "attending": attending,
//     "relate": relate,
//     "paymentdone": paymentdone,
//     "category_mapping": List<dynamic>.from(categoryMapping.map((x) => x.toJson())),
//     "media": List<dynamic>.from(media.map((x) => x.toJson())),
//     "feedqueryanswered": List<dynamic>.from(feedqueryanswered.map((x) => x.toJson())),
//     "feedevent": feedevent,
//   };
// }
//
// class CategoryMapping {
//   CategoryMapping({
//     this.updatedAt,
//     this.category,
//   });
//
//   DateTime updatedAt;
//   Category category;
//
//   factory CategoryMapping.fromJson(Map<String, dynamic> json) => CategoryMapping(
//     updatedAt: DateTime.parse(json["updated_at"]),
//     category: Category.fromJson(json["category"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
//     "category": category.toJson(),
//   };
// }
//
// class Category {
//   Category({
//     this.id,
//     this.category,
//     this.iconPath,
//   });
//
//   int id;
//   String category;
//   String iconPath;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     id: json["id"],
//     category: json["category"],
//     iconPath: json["icon_path"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "category": category,
//     "icon_path": iconPath,
//   };
// }
//
// class Feedqueryanswered {
//   Feedqueryanswered({
//     this.id,
//     this.feedsId,
//     this.assignedUserExpertId,
//     this.feedStatus,
//     this.intialUserExpertId,
//     this.totalfollowups,
//     this.createdAt,
//     this.createdBy,
//     this.updatedAt,
//     this.latestanswer,
//     this.author,
//   });
//
//   int id;
//   int feedsId;
//   int assignedUserExpertId;
//   String feedStatus;
//   dynamic intialUserExpertId;
//   int totalfollowups;
//   DateTime createdAt;
//   int createdBy;
//   DateTime updatedAt;
//   dynamic latestanswer;
//   dynamic author;
//
//   factory Feedqueryanswered.fromJson(Map<String, dynamic> json) => Feedqueryanswered(
//     id: json["id"],
//     feedsId: json["feeds_id"],
//     assignedUserExpertId: json["assigned_user_expert_id"],
//     feedStatus: json["feed_status"],
//     intialUserExpertId: json["intial_user_expert_id"],
//     totalfollowups: json["totalfollowups"],
//     createdAt: DateTime.parse(json["created_at"]),
//     createdBy: json["created_by"],
//     updatedAt: DateTime.parse(json["updated_at"]),
//     latestanswer: json["latestanswer"],
//     author: json["author"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "feeds_id": feedsId,
//     "assigned_user_expert_id": assignedUserExpertId,
//     "feed_status": feedStatus,
//     "intial_user_expert_id": intialUserExpertId,
//     "totalfollowups": totalfollowups,
//     "created_at": createdAt.toIso8601String(),
//     "created_by": createdBy,
//     "updated_at": updatedAt.toIso8601String(),
//     "latestanswer": latestanswer,
//     "author": author,
//   };
// }
//
// class Media {
//   Media({
//     this.id,
//     this.mediaType,
//     this.mediaPath,
//     this.updatedAt,
//     this.feedsId,
//   });
//
//   int id;
//   MediaType mediaType;
//   String mediaPath;
//   DateTime updatedAt;
//   int feedsId;
//
//   factory Media.fromJson(Map<String, dynamic> json) => Media(
//     id: json["id"],
//     mediaType: mediaTypeValues.map[json["media_type"]],
//     mediaPath: json["media_path"],
//     updatedAt: DateTime.parse(json["updated_at"]),
//     feedsId: json["feeds_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "media_type": mediaTypeValues.reverse[mediaType],
//     "media_path": mediaPath,
//     "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
//     "feeds_id": feedsId,
//   };
// }
//
// enum MediaType { COVER_IMAGE }
//
// final mediaTypeValues = EnumValues({
//   "cover_image": MediaType.COVER_IMAGE
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
