import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/media_type.dart';

part 'feed_media.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class FeedMedia {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "media_type")
  MediaType mediaType;

  @JsonKey(name: "media_path")
  String mediaPath;

  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  @JsonKey(name: "feeds_id")
  int feedsId;

  FeedMedia({
    this.id,
    this.mediaType,
    this.mediaPath,
    this.updatedAt,
    this.feedsId,
  });

  factory FeedMedia.fromJson(Map<String, dynamic> json) => _$FeedMediaFromJson(json);

  Map<String, dynamic> toJson() => _$FeedMediaToJson(this);

// factory FeedMedia.fromJson(Map<String, dynamic> json) => FeedMedia(
//       id: json["id"],
//       mediaType: mediaTypeValues.map[json["media_type"]],
//       mediaPath: json["media_path"],
//       updatedAt: DateTime.parse(json["updated_at"]),
//       feedsId: json["feeds_id"],
//     );
//
// Map<String, dynamic> toJson() => {
//       "id": id,
//       "media_type": mediaTypeValues.reverse[mediaType],
//       "media_path": mediaPath,
//       "updated_at":
//           "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
//       "feeds_id": feedsId,
//     };
}
