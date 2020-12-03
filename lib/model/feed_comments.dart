import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/flagged.dart';
import 'package:owomaniya/Enums/hidden.dart';
import 'package:owomaniya/Enums/is_anonymous.dart';
import 'package:owomaniya/model/feeds.dart';
import 'package:owomaniya/model/user_devices.dart';
import 'package:owomaniya/model/users.dart';

part 'feed_comments.g.dart';

@JsonSerializable(explicitToJson: true,includeIfNull: true,nullable: true,anyMap: true)
class FeedComments {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'feeds_id')
  List<Feeds> feedsId;

  @JsonKey(name: 'users_id')
  List<Users> usersId;

  @JsonKey(name: 'comment')
  String comment;

  @JsonKey(name: 'feed_comment_id')
  int feedCommentsId;

  @JsonKey(name: 'is_anonymous')
  IsAnonymous isAnonymous;

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

  @JsonKey(name: 'user_devices_id')
  List<UserDevices> userDevicesId;

  @JsonKey(name: 'hidden')
  Hidden hidden;

  @JsonKey(name: 'flagged')
  Flagged flagged;

  @JsonKey(name: 'flag_note')
  String flagNote;

  FeedComments(
      {this.id,
      this.feedsId,
      this.usersId,
      this.comment,
      this.feedCommentsId,
      this.isAnonymous,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.deletedAt,
      this.userDevicesId,
      this.hidden,
      this.flagged,
      this.flagNote});

  factory FeedComments.fromJson(Map<String, dynamic> map) =>
      _$FeedCommentsFromJson(map);

  Map<String, dynamic> toJson() => _$FeedCommentsToJson(this);
}
