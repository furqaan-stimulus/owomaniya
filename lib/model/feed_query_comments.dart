import 'package:owomaniya/Enums/hidden.dart';

class FeedQueryComments {
  String id;
  String usersId;
  String feedQueryId;
  String comment;
  String isAnonymous;
  String createdAt;
  String createdBy;
  String updatedAt;
  String updatedBy;
  String deletedAt;
  String feedQueryCommentsId;
  String userDevicesId;
  Hidden hidden;

  FeedQueryComments({
    this.id,
    this.usersId,
    this.feedQueryId,
    this.comment,
    this.isAnonymous,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.feedQueryCommentsId,
    this.userDevicesId,
    this.hidden,
  });

  factory FeedQueryComments.fromJson(Map<String, dynamic> map) {
    return FeedQueryComments(
      id: map['id'],
      usersId: map['users_id'],
      feedQueryId: map['feed_query_id'],
      isAnonymous: map['is_anonymous'],
      createdAt: map['created_at'],
      createdBy: map['created_by'],
      updatedAt: map['updated_at'],
      updatedBy: map['updated_by'],
      deletedAt: map['deleted_at'],
      feedQueryCommentsId: map['feed_query_comments_id'],
      userDevicesId: map['user_devices_id'],
      hidden: map['hidden'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['users_id'] = this.usersId;
    data['feed_query_id'] = this.feedQueryId;
    data['is_anonymous'] = this.isAnonymous;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    data['feed_query_comments_id'] = this.feedQueryCommentsId;
    data['user_devices_id'] = this.userDevicesId;
    data['hidden'] = this.hidden;
    return data;
  }
}
