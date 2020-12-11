import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/model/category.dart';
import 'package:owomaniya/model/feed.dart';

class Categorymapping {

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

  Feed feed;

  Category category;

  Categorymapping(
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

  factory Categorymapping.fromJson(Map<String, dynamic> json) => Categorymapping(
        updatedAt: DateTime.parse(json["updated_at"]),
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "category": category.toJson(),
      };
}
