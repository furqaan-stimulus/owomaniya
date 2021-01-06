import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/is_anonymous.dart';
import 'package:owomaniya/model/category_mapping.dart';
import 'package:owomaniya/model/feed_query_assigned.dart';
import 'package:owomaniya/model/user_devices.dart';
import 'detail.dart';
import 'feed_media.dart';

part 'feed.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class Feed {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'feed_title')
  String feedTitle;

  @JsonKey(name: 'feed_url')
  String feedUrl;

  @JsonKey(name: 'feed_date')
  DateTime feedDate;

  @JsonKey(name: 'feed_type')
  String feedType;

  @JsonKey(name: 'feed_detail')
  String feedDetail;

  @JsonKey(name: 'feed_like_cnt')
  int feedLikeCount;

  @JsonKey(name: 'feed_comment_cnt')
  int feedCommentCount;

  @JsonKey(name: 'feed_share_cnt')
  int feedShareCount;

  @JsonKey(name: 'feed_attendance_cnt')
  int feedAttendanceCount;

  @JsonKey(name: 'feed_relate_cnt')
  int feedRelateCount;

  @JsonKey(name: 'feed_impression_cnt')
  int feedImpressionCount;

  @JsonKey(name: 'feed_status')
  String feedStatus;

  @JsonKey(name: 'is_anonymous')
  IsAnonymous isAnonymous;

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

  @JsonKey(name: 'user_devices_id')
  UserDevices userDevicesId;

  @JsonKey(name: 'hidden')
  String hidden;

  @JsonKey(name: 'can_comment')
  String canComment;

  @JsonKey(name: 'end_date')
  DateTime endDate;

  @JsonKey(name: 'feedtypekey')
  String feedTypeKey;

  @JsonKey(name: 'bookmarked')
  bool bookmarked;

  @JsonKey(name: 'liked')
  bool liked;

  @JsonKey(name: 'attending')
  bool attending;

  @JsonKey(name: 'relate')
  bool relate;

  @JsonKey(name: 'paymentdone')
  String paymentDone;

  @JsonKey(name: 'wp_id')
  int wpId;

  @JsonKey(name: "details")
  Detail details;

  @JsonKey(name: "media")
  List<FeedMedia> media;

  @JsonKey(name: "categorymapping")
  List<CategoryMapping> categoryMapping;

  @JsonKey(name: "feedqueryassigned")
  List<FeedQueryAssigned> feedQueryAssigned;

  @JsonKey(name: "feedevent")
  dynamic feedEvent;

  Feed({
    this.id,
    this.feedTitle,
    this.feedUrl,
    this.feedDate,
    this.feedType,
    this.feedDetail,
    this.feedLikeCount,
    this.feedCommentCount,
    this.feedShareCount,
    this.feedAttendanceCount,
    this.feedRelateCount,
    this.canComment,
    this.feedTypeKey,
    this.bookmarked,
    this.liked,
    this.attending,
    this.relate,
    this.paymentDone,
    this.details,
    this.media,
    this.categoryMapping,
    this.feedQueryAssigned,
    this.feedEvent,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);

// factory Feed.fromJson(Map<String, dynamic> json) => Feed(
//       id: json["id"],
//       feedTitle: json["feed_title"],
//       feedUrl: json["feed_url"],
//       feedDate: DateTime.parse(json["feed_date"]),
//       // feedType: feedTypeValues.map[json["feed_type"]],
//       feedDetail: json["feed_detail"],
//       feedLikeCnt: json["feed_like_cnt"],
//       feedCommentCnt: json["feed_comment_cnt"],
//       feedShareCnt: json["feed_share_cnt"],
//       feedAttendanceCnt: json["feed_attendance_cnt"],
//       feedRelateCnt: json["feed_relate_cnt"],
//       canComment: canCommentValues.map[json["can_comment"]],
//       feedtypekey: json["feedtypekey"],
//       bookmarked: json["bookmarked"],
//       liked: json["liked"],
//       attending: json["attending"],
//       relate: json["relate"],
//       paymentdone: json["paymentdone"],
//       details: Details.fromJson(json["details"]),
//       media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
//       categorymapping:
//           List<Categorymapping>.from(json["categorymapping"].map((x) => Categorymapping.fromJson(x))),
//       feedqueryassigned:
//           List<Feedqueryassigned>.from(json["feedqueryassigned"].map((x) => Feedqueryassigned.fromJson(x))),
//     );
//
// Map<String, dynamic> toJson() => {
//       "id": id,
//       "feed_title": feedTitle,
//       "feed_url": feedUrl,
//       "feed_date": feedDate.toString(),
//       // "feed_type": feedTypeValues.reverse[feedType],
//       "feed_detail": feedDetail,
//       "feed_like_cnt": feedLikeCnt,
//       "feed_comment_cnt": feedCommentCnt,
//       "feed_share_cnt": feedShareCnt,
//       "feed_attendance_cnt": feedAttendanceCnt,
//       "feed_relate_cnt": feedRelateCnt,
//       "can_comment": canCommentValues.reverse[canComment],
//       "feedtypekey": feedtypekey,
//       "bookmarked": bookmarked,
//       "liked": liked,
//       "attending": attending,
//       "relate": relate,
//       "paymentdone": paymentdone,
//       "details": details.toJson(),
//       "media": List<dynamic>.from(media.map((x) => x.toJson())),
//       "categorymapping": List<dynamic>.from(categorymapping.map((x) => x.toJson())),
//       "feedqueryassigned": List<dynamic>.from(feedqueryassigned.map((x) => x.toJson())),
//     };
}
