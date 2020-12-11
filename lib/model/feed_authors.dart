import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/is_primary.dart';
import 'package:owomaniya/model/feed.dart';
import 'package:owomaniya/model/user.dart';
class FeedAuthors {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'feeds_id')
  int feedsId;

  @JsonKey(name: 'users_id')
  int usersId;

  @JsonKey(name: 'is_primary')
  IsPrimary isPrimary; //enum

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

  @JsonKey(name: 'user')
  User user;

  Feed feed;

  FeedAuthors(
      {this.id,
      this.feedsId,
      this.usersId,
      this.isPrimary,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.deletedAt,
      this.user,
      this.feed,});

}
