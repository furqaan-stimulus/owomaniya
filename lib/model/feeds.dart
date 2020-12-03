import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/can_comment.dart';
import 'package:owomaniya/Enums/feed_status.dart';
import 'package:owomaniya/Enums/feed_type.dart';
import 'package:owomaniya/Enums/hidden.dart';
import 'package:owomaniya/Enums/is_anonymous.dart';
import 'package:owomaniya/model/feed_category_mapping.dart';
import 'package:owomaniya/model/feed_media.dart';
import 'package:owomaniya/model/user_devices.dart';
import 'details.dart';

part 'feeds.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class Feeds {
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

  @JsonKey(name: 'feed_like_count')
  int feedLikeCount;

  @JsonKey(name: 'feed_comment_count')
  int feedCommentCount;

  @JsonKey(name: 'feed_share_count')
  int feedShareCount;

  @JsonKey(name: 'feed_attendance_count')
  int feedAttendanceCount;

  @JsonKey(name: 'feed_relate_count')
  int feedRelateCount;

  @JsonKey(name: 'feed_impression_count')
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
  String paymentdone;

  @JsonKey(name: 'wp_id')
  int wpId;

  @JsonKey(name: "details")
  Details details;

  @JsonKey(name: "media")
  List<FeedMedia> media;

  @JsonKey(name: "categorymapping")
  List<FeedCategoryMapping> categoryMapping;

  // @JsonKey(name: "feedqueryassigned")
  // List<dynamic> feedQueryAssigned;

  Feeds({
    this.id,
    this.feedTitle,
    this.feedDate,
    this.feedType,
    this.feedDetail,
    this.feedLikeCount,
    this.feedShareCount,
    this.feedCommentCount,
    this.feedAttendanceCount,
    this.feedRelateCount,
    this.feedImpressionCount,
    this.feedStatus,
    this.isAnonymous,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.userDevicesId,
    this.hidden,
    this.canComment,
    this.endDate,
    this.feedUrl,
    this.wpId,
    this.details,
    this.media,
    this.categoryMapping,
    this.attending,
    this.bookmarked,
    this.feedTypeKey,
    this.liked,
    this.paymentdone,
    this.relate,
  });

  factory Feeds.fromJson(Map<String, dynamic> map) => _$FeedsFromJson(map);

  Map<String, dynamic> toJson() => _$FeedsToJson(this);
}
