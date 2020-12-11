import 'package:owomaniya/model/parent_expertise.dart';

class Expertexpertisemapping{
  Expertexpertisemapping({
    this.updatedAt,
    this.parentexpertise,
  });

  DateTime updatedAt;
  Parentexpertise parentexpertise;

  factory Expertexpertisemapping.fromJson(Map<String, dynamic> json) => Expertexpertisemapping(
    updatedAt: DateTime.parse(json["updated_at"]),
    parentexpertise: Parentexpertise.fromJson(json["parentexpertise"]),
  );

  Map<String, dynamic> toJson() => {
    "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
    "parentexpertise": parentexpertise.toJson(),
  };
}