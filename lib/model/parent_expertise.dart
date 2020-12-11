class Parentexpertise {
  Parentexpertise({
    this.id,
    this.expertiseId,
    this.expertiseName,
    this.iconPath,
    this.updatedAt,
  });

  int id;
  dynamic expertiseId;
  String expertiseName;
  dynamic iconPath;
  dynamic updatedAt;

  factory Parentexpertise.fromJson(Map<String, dynamic> json) => Parentexpertise(
        id: json["id"],
        expertiseId: json["expertise_id"],
        expertiseName: json["expertise_name"],
        iconPath: json["icon_path"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "expertise_id": expertiseId,
        "expertise_name": expertiseName,
        "icon_path": iconPath,
        "updated_at": updatedAt,
      };
}
