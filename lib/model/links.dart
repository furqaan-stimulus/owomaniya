import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class Links {
  Links({
    this.self,
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  @JsonKey(name: "self")
  String self;
  @JsonKey(name: "first")
  String first;
  @JsonKey(name: "last")
  String last;
  @JsonKey(name: "prev")
  dynamic prev;
  @JsonKey(name: "next")
  String next;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

  // factory Links.fromJson(Map<String, dynamic> json) => Links(
  //   self: json["self"],
  //   first: json["first"],
  //   last: json["last"],
  //   prev: json["prev"],
  //   next: json["next"],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "self": self,
  //   "first": first,
  //   "last": last,
  //   "prev": prev,
  //   "next": next,
  // };
}
