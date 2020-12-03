import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/model/category.dart';
import 'package:owomaniya/model/feeds.dart';

part 'feed_category_mapping.g.dart';

@JsonSerializable(
    explicitToJson: true, includeIfNull: true, nullable: true, anyMap: true)
class FeedCategoryMapping {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'feeds_id')
  int feedsId;

  @JsonKey(name: 'category_id')
  Category categoryId;

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

  Feeds feed;

  @JsonKey(name: 'category')
  Category category;

  FeedCategoryMapping(
      {this.id,
      this.feedsId,
      this.categoryId,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.deletedAt,
      this.feed,
      this.category});

  factory FeedCategoryMapping.fromJson(Map<String, dynamic> map) =>
      _$FeedCategoryMappingFromJson(map);

  Map<String, dynamic> toJson() => _$FeedCategoryMappingToJson(this);
}
