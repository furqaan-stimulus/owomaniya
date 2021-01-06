import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/model/category.dart';
import 'package:owomaniya/model/feed.dart';

part 'category_mapping.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class CategoryMapping {

  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  @JsonKey(name: 'category')
  Category category;

  CategoryMapping({
    this.updatedAt,
    this.category,
  });

  factory CategoryMapping.fromJson(Map<String, dynamic> json) => _$CategoryMappingFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryMappingToJson(this);

// factory CategoryMapping.fromJson(Map<String, dynamic> json) => CategoryMapping(
//       updatedAt: DateTime.parse(json["updated_at"]),
//       category: Category.fromJson(json["category"]),
//     );
//
// Map<String, dynamic> toJson() => {
//       "updated_at":
//           "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
//       "category": category.toJson(),
//     };
}
