import 'package:json_annotation/json_annotation.dart';

part 'health_details.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class HealthDetails {
  HealthDetails({
    this.height,
    this.weight,
    this.heightUnit,
    this.weightUnit,
    this.bloodGroup,
    this.bmi,
  });

  @JsonKey(name: "height")
  int height;

  @JsonKey(name: "weight")
  int weight;

  @JsonKey(name: "heightUnit")
  String heightUnit;

  @JsonKey(name: "weightunit")
  String weightUnit;

  @JsonKey(name: "bloodGroup")
  String bloodGroup;

  @JsonKey(name: "bmi")
  int bmi;

  factory HealthDetails.fromJson(Map<String, dynamic> json) => _$HealthDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$HealthDetailsToJson(this);

// factory HealthDetails.fromJson(Map<String, dynamic> json) => HealthDetails(
//       height: json["height"] == null ? null : json["height"],
//       weight: json["weight"] == null ? null : json["weight"],
//       heightunit: json["heightunit"] == null ? null : json["heightunit"],
//       weightunit: json["weightunit"] == null ? null : json["weightunit"],
//       bloodGroup: json["blood_group"] == null ? null : json["blood_group"],
//       bmi: json["bmi"] == null ? null : json["bmi"],
//     );
//
// Map<String, dynamic> toJson() => {
//       "height": height,
//       "weight": weight,
//       "heightunit": heightunit,
//       "weightunit": weightunit,
//       "blood_group": bloodGroup,
//       "bmi": bmi,
//     };
}
