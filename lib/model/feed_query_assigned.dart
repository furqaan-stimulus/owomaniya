import 'package:owomaniya/model/assigned_expert.dart';

class Feedqueryassigned {
  Feedqueryassigned({
    this.id,
    this.feedsId,
    this.assignedUserExpertId,
    this.feedStatus,
    this.intialUserExpertId,
    this.totalfollowups,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.latestanswer,
    this.assignedexpert,
  });

  int id;
  int feedsId;
  int assignedUserExpertId;
  String feedStatus;
  dynamic intialUserExpertId;
  int totalfollowups;
  DateTime createdAt;
  int createdBy;
  DateTime updatedAt;
  dynamic latestanswer;
  Assignedexpert assignedexpert;

  factory Feedqueryassigned.fromJson(Map<String, dynamic> json) => Feedqueryassigned(
    id: json["id"],
    feedsId: json["feeds_id"],
    assignedUserExpertId: json["assigned_user_expert_id"],
    feedStatus: json["feed_status"],
    intialUserExpertId: json["intial_user_expert_id"],
    totalfollowups: json["totalfollowups"],
    createdAt: DateTime.parse(json["created_at"]),
    createdBy: json["created_by"],
    updatedAt: DateTime.parse(json["updated_at"]),
    latestanswer: json["latestanswer"],
    assignedexpert: Assignedexpert.fromJson(json["assignedexpert"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "feeds_id": feedsId,
    "assigned_user_expert_id": assignedUserExpertId,
    "feed_status": feedStatus,
    "intial_user_expert_id": intialUserExpertId,
    "totalfollowups": totalfollowups,
    "created_at": createdAt.toString(),
    "created_by": createdBy,
    "updated_at": updatedAt.toString(),
    "latestanswer": latestanswer,
    "assignedexpert": assignedexpert.toJson(),
  };
}