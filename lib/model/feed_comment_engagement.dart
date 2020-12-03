import 'package:owomaniya/Enums/engagement_type.dart';

class FeedCommentEngagement {
  String id;
  String usersId;
  EngagementType engagementType;
  String createdAt;
  String createdBy;
  String updatedAt;
  String updatedBy;
  String deletedAt;
  String feedCommentId;

  FeedCommentEngagement(
      {this.id,
      this.usersId,
      this.engagementType,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.deletedAt,
      this.feedCommentId});

  factory FeedCommentEngagement.fromJson(Map<String, dynamic> map) {
    return FeedCommentEngagement(
      id: map['id'],
      usersId: map['users_id'],
      engagementType: map['engagement_type'],
      createdAt: map['created_at'],
      createdBy: map['created_by'],
      updatedAt: map['updated_at'],
      updatedBy: map['updated_by'],
      deletedAt: map['deleted_at'],
      feedCommentId: map['feed_comment_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['users_id'] = this.usersId;
    data['engagement_type'] = this.engagementType;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    data['feed_comment_id'] = this.feedCommentId;
  }
}
