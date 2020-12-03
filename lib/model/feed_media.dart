import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/media_type.dart';
import 'package:owomaniya/model/feeds.dart';

part 'feed_media.g.dart';

@JsonSerializable(
  explicitToJson: true,includeIfNull: true,nullable: true,anyMap: true,
)
class FeedMedia {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'media_type')
  MediaType mediaType;

  @JsonKey(name: 'media_path')
  String mediaPath;

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

  @JsonKey(name: 'feeds_id')
  int feedsId;

  Feeds feeds;

  FeedMedia({
    this.id,
    this.mediaType,
    this.mediaPath,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.feedsId,
    this.feeds,
  });

  factory FeedMedia.fromJson(Map<String, dynamic> map) =>
      _$FeedMediaFromJson(map);

  Map<String, dynamic> toJson() => _$FeedMediaToJson(this);
}
