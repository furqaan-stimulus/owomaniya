import 'package:owomaniya/Enums/platforms.dart';

class FeedShares {
  String id;
  String createdAt;
  String createdBy;
  String updatedAt;
  String updatedBy;
  String deletedAt;
  Platforms platforms;
  String feedsId;
  String usersId;

  FeedShares({
    this.id,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.platforms,
    this.feedsId,
    this.usersId,
  });

  factory FeedShares.fromJson(Map<String, dynamic> map) {
    return FeedShares(
      id: map['id'],
      createdAt: map['created_at'],
      createdBy: map['created_by'],
      updatedAt: map['updated_at'],
      updatedBy: map['updated_by'],
      deletedAt: map['deleted_at'],
      platforms: map['platform'],
      feedsId: map['feeds_id'],
      usersId: map['users_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    data['platform'] = this.platforms;
    data['feeds_id'] = this.feedsId;
    data['users_id'] = this.usersId;
    return data;
  }
}
