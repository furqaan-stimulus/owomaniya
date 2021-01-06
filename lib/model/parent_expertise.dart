import 'package:json_annotation/json_annotation.dart';

part 'parent_expertise.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class ParentExpertise {
  ParentExpertise({
    this.id,
    this.expertiseId,
    this.expertiseName,
    this.iconPath,
    this.updatedAt,
  });

  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "expertise_id")
  dynamic expertiseId;

  @JsonKey(name: "expertise_name")
  String expertiseName;

  @JsonKey(name: "icon_path")
  dynamic iconPath;

  @JsonKey(name: "updated_at")
  dynamic updatedAt;

  factory ParentExpertise.fromJson(Map<String, dynamic> json) => _$ParentExpertiseFromJson(json);

  Map<String, dynamic> toJson() => _$ParentExpertiseToJson(this);

// factory ParentExpertise.fromJson(Map<String, dynamic> json) => ParentExpertise(
//       id: json["id"],
//       expertiseId: json["expertise_id"],
//       expertiseName: json["expertise_name"],
//       iconPath: json["icon_path"],
//       updatedAt: json["updated_at"],
//     );
//
// Map<String, dynamic> toJson() => {
//       "id": id,
//       "expertise_id": expertiseId,
//       "expertise_name": expertiseName,
//       "icon_path": iconPath,
//       "updated_at": updatedAt,
//     };
}
