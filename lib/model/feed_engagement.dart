import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/engagement_type.dart';
import 'package:owomaniya/model/feed.dart';
import 'package:owomaniya/model/user.dart';
class FeedEngagement {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'feeds_id')
  List<Feed> feedsId;

  @JsonKey(name: 'users_id')
  List<User> usersId;

  @JsonKey(name: 'engagement_type')
  EngagementType engagementType;

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

  FeedEngagement(
      {this.id,
      this.usersId,
      this.feedsId,
      this.engagementType,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.deletedAt});
}
