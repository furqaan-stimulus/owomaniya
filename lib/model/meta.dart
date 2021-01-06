import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  @JsonKey(name: "current_page")
  int currentPage;

  @JsonKey(name: "from")
  int from;

  @JsonKey(name: "last_page")
  int lastPage;

  @JsonKey(name: "path")
  String path;

  @JsonKey(name: "per_page")
  int perPage;

  @JsonKey(name: "to")
  int to;

  @JsonKey(name: "total")
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

// factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//       currentPage: json["current_page"],
//       from: json["from"],
//       lastPage: json["last_page"],
//       path: json["path"],
//       perPage: json["per_page"],
//       to: json["to"],
//       total: json["total"],
//     );
//
// Map<String, dynamic> toJson() => {
//       "current_page": currentPage,
//       "from": from,
//       "last_page": lastPage,
//       "path": path,
//       "per_page": perPage,
//       "to": to,
//       "total": total,
//     };
}
