import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/media_type.dart';
import 'package:owomaniya/model/feed.dart';

class Media {
  int id;
  MediaType mediaType;
  String mediaPath;
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
  Feed feeds;

  Media({
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

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        mediaType: mediaTypeValues.map[json["media_type"]],
        mediaPath: json["media_path"],
        updatedAt: DateTime.parse(json["updated_at"]),
        feedsId: json["feeds_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "media_type": mediaTypeValues.reverse[mediaType],
        "media_path": mediaPath,
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "feeds_id": feedsId,
      };
}
