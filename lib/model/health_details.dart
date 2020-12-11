class HealthDetails {
  HealthDetails({
    this.height,
    this.weight,
    this.heightunit,
    this.weightunit,
    this.bloodGroup,
    this.bmi,
  });

  int height;
  int weight;
  String heightunit;
  String weightunit;
  String bloodGroup;
  int bmi;

  factory HealthDetails.fromJson(Map<String, dynamic> json) => HealthDetails(
        height: json["height"] == null ? null : json["height"],
        weight: json["weight"] == null ? null : json["weight"],
        heightunit: json["heightunit"] == null ? null : json["heightunit"],
        weightunit: json["weightunit"] == null ? null : json["weightunit"],
        bloodGroup: json["blood_group"] == null ? null : json["blood_group"],
        bmi: json["bmi"] == null ? null : json["bmi"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "weight": weight,
        "heightunit": heightunit,
        "weightunit": weightunit,
        "blood_group": bloodGroup,
        "bmi": bmi,
      };
}
