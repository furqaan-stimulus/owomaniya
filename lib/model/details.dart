import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/model/feed_authors.dart';

part 'details.g.dart';

@JsonSerializable(explicitToJson: true,includeIfNull: true,nullable: true,anyMap: true)
class Details {
  @JsonKey(name: "authordetails")
  List<FeedAuthors> feedAuthorDetails;

  // @JsonKey(name: "otherdetails")
  // List<dynamic> otherDetails;

  Details(this.feedAuthorDetails,);

  factory Details.fromJson(Map<String, dynamic> map) => _$DetailsFromJson(map);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
