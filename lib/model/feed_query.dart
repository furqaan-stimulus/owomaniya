import 'package:owomaniya/Enums/feed_status.dart';

class FeedQuery {
  String id;
  String assignedUserExpertId;
  FeedStatus feedStatus;
  String requestedTo;
  String initialUserExpertId;
  String feedQueryAnswered;
  String totalFollowups;
  DateTime createdAt;
  int createdBy;
  DateTime updatedAt;
  int updatedBy;
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

  factory FeedQuery.fromJson(Map<String, dynamic> map) {
    return FeedQuery(
      id: map['id'],
      assignedUserExpertId: map['assigned_user_expert_id'],
      feedStatus: map['feed_status'],
      requestedTo: map['requested_to'],
      initialUserExpertId: map['initial_user_expert_id'],
      feedQueryAnswered: map['feed_query_answered'],
      totalFollowups: map['totalfollowups'],
      createdAt: map['created_at'],
      createdBy: map['created_by'],
      updatedAt: map['updated_at'],
      updatedBy: map['updated_by'],
      deletedAt: map['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assigned_user_expert_id'] = this.assignedUserExpertId;
    data['feed_status'] = this.feedStatus;
    data['requested_to'] = this.requestedTo;
    data['initial_user_expert_id'] = this.initialUserExpertId;
    data['feed_query_answered'] = this.feedQueryAnswered;
    data['totalfollowups'] = this.totalFollowups;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
