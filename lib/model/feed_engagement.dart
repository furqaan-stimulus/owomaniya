import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/engagement_type.dart';
import 'package:owomaniya/model/feeds.dart';
import 'package:owomaniya/model/users.dart';

part 'feed_engagement.g.dart';

@JsonSerializable(explicitToJson: true, )
class FeedEngagement {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'feeds_id')
  List<Feeds> feedsId;

  @JsonKey(name: 'users_id')
  List<Users> usersId;

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

  factory FeedEngagement.fromJson(Map<String, dynamic> map) =>
      _$FeedEngagementFromJson(map);

  Map<String, dynamic> toJson() => _$FeedEngagementToJson(this);
}
