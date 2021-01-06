import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/model/parent_expertise.dart';

part 'expert_expertise_mapping.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class ExpertExpertiseMapping {
  ExpertExpertiseMapping({
    this.updatedAt,
    this.parentExpertise,
  });

  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  @JsonKey(name: "parentexpertise")
  ParentExpertise parentExpertise;

  factory ExpertExpertiseMapping.fromJson(Map<String, dynamic> json) =>
      _$ExpertExpertiseMappingFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertExpertiseMappingToJson(this);

// factory ExpertExpertiseMapping.fromJson(Map<String, dynamic> json) => ExpertExpertiseMapping(
//   updatedAt: DateTime.parse(json["updated_at"]),
//   parentexpertise: Parentexpertise.fromJson(json["parentexpertise"]),
// );
//
// Map<String, dynamic> toJson() => {
//   "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
//   "parentexpertise": parentexpertise.toJson(),
// };
}
