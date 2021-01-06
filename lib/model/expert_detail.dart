import 'package:json_annotation/json_annotation.dart';

part 'expert_detail.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class ExpertDetail {
  ExpertDetail({
    this.id,
    this.userExpertExp,
  });

  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "user_expert_exp")
  int userExpertExp;

  factory ExpertDetail.fromJson(Map<String, dynamic> json) => _$ExpertDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ExpertDetailToJson(this);
// factory ExpertDetail.fromJson(Map<String, dynamic> json) => ExpertDetail(
//   id: json["id"],
//   userExpertExp: json["user_expert_exp"],
// );
//
// Map<String, dynamic> toJson() => {
//   "id": id,
//   "user_expert_exp": userExpertExp,
// };
}
