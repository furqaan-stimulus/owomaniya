import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/feed_status.dart';

part 'feed_query.g.dart';

@JsonSerializable(
  explicitToJson: true,includeIfNull: true,nullable: true
)
class FeedQuery {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'assign__user_expert_id')
  String assignedUserExpertId;
  @JsonKey(name: 'feed_status')
  FeedStatus feedStatus;
  @JsonKey(name: 'request_to')
  String requestedTo;
  @JsonKey(name: 'initial_expert_id')
  String initialUserExpertId;

  @JsonKey(name: 'feed_query_answered')
  String feedQueryAnswered;

  @JsonKey(name: 'totalfollowups')
  String totalFollowups;

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

  FeedQuery({
    this.id,
    this.assignedUserExpertId,
    this.feedStatus,
    this.requestedTo,
    this.initialUserExpertId,
    this.feedQueryAnswered,
    this.totalFollowups,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
  });

  factory FeedQuery.fromJson(Map<String, dynamic> map) =>
      _$FeedQueryFromJson(map);

  Map<String, dynamic> toJson() => _$FeedQueryToJson(this);
// factory FeedQuery.fromJson(Map<String, dynamic> map) {
//   return FeedQuery(
//     id: map['id'],
//     feedsId: map['feeds_id'],
//     assignedUserExpertId: map['assigned_user_expert_id'],
//     feedStatus: map['feed_status'],
//     requestedTo: map['requested_to'],
//     initialUserExpertId: map['initial_user_expert_id'],
//     feedQueryAnswered: map['feed_query_answered'],
//     totalFollowups: map['totalfollowups'],
//     createdAt: map['created_at'],
//     createdBy: map['created_by'],
//     updatedAt: map['updated_at'],
//     updatedBy: map['updated_by'],
//     deletedAt: map['deleted_at'],
//   );
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['feeds_id'] = this.feedsId;
//   data['assigned_user_expert_id'] = this.assignedUserExpertId;
//   data['feed_status'] = this.feedStatus;
//   data['requested_to'] = this.requestedTo;
//   data['initial_user_expert_id'] = this.initialUserExpertId;
//   data['feed_query_answered'] = this.feedQueryAnswered;
//   data['totalfollowups'] = this.totalFollowups;
//   data['created_at'] = this.createdAt;
//   data['created_by'] = this.createdBy;
//   data['updated_at'] = this.updatedAt;
//   data['updated_by'] = this.updatedBy;
//   data['deleted_at'] = this.deletedAt;
//   return data;
// }
}
