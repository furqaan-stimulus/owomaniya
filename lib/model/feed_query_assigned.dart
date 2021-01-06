import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/model/assigned_expert.dart';

part 'feed_query_assigned.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class FeedQueryAssigned {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "feeds_id")
  int feedsId;

  @JsonKey(name: "assigned_user_expert_id")
  int assignedUserExpertId;

  @JsonKey(name: "feed_status")
  String feedStatus;

  @JsonKey(name: "intial_user_expert_id")
  dynamic initialUserExpertId;

  @JsonKey(name: "totalfollowups")
  int totalFollowUps;

  @JsonKey(name: "created_at")
  DateTime createdAt;

  @JsonKey(name: "created_by")
  int createdBy;

  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  @JsonKey(name: "latestanswer")
  dynamic latestAnswer;

  @JsonKey(name: "assignedexpert")
  AssignedExpert assignedExpert;

  FeedQueryAssigned({
    this.id,
    this.feedsId,
    this.assignedUserExpertId,
    this.feedStatus,
    this.initialUserExpertId,
    this.totalFollowUps,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.latestAnswer,
    this.assignedExpert,
  });

  factory FeedQueryAssigned.fromJson(Map<String, dynamic> json) =>
      _$FeedQueryAssignedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedQueryAssignedToJson(this);

// factory FeedQueryAssigned.fromJson(Map<String, dynamic> json) => FeedQueryAssigned(
//   id: json["id"],
//   feedsId: json["feeds_id"],
//   assignedUserExpertId: json["assigned_user_expert_id"],
//   feedStatus: json["feed_status"],
//   intialUserExpertId: json["intial_user_expert_id"],
//   totalfollowups: json["totalfollowups"],
//   createdAt: DateTime.parse(json["created_at"]),
//   createdBy: json["created_by"],
//   updatedAt: DateTime.parse(json["updated_at"]),
//   latestanswer: json["latestanswer"],
//   assignedexpert: AssignedExpert.fromJson(json["assignedexpert"]),
// );
//
// Map<String, dynamic> toJson() => {
//   "id": id,
//   "feeds_id": feedsId,
//   "assigned_user_expert_id": assignedUserExpertId,
//   "feed_status": feedStatus,
//   "intial_user_expert_id": intialUserExpertId,
//   "totalfollowups": totalfollowups,
//   "created_at": createdAt.toString(),
//   "created_by": createdBy,
//   "updated_at": updatedAt.toString(),
//   "latestanswer": latestanswer,
//   "assignedexpert": assignedexpert.toJson(),
// };
}
