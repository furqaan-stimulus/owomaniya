import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/model/author_detail.dart';

part 'detail.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class Detail {
  Detail({
    this.authorDetails,
    this.otherDetails,
  });

  @JsonKey(name: 'authordetails')
  List<AuthorDetail> authorDetails;
  @JsonKey(name: 'otherdetails')
  List<dynamic> otherDetails;


  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);

  // factory Details.fromJson(Map<String, dynamic> json) => Details(
  //       authorDetails: List<DetailsAuthordetail>.from(
  //           json["authordetails"].map((x) => DetailsAuthordetail.fromJson(x))),
  //       otherdetails: List<dynamic>.from(json["otherdetails"].map((x) => x)),
  //     );
  //
  // Map<String, dynamic> toJson() => {
  //       "authordetails": List<dynamic>.from(authorDetails.map((x) => x.toJson())),
  //       "otherdetails": List<dynamic>.from(otherdetails.map((x) => x)),
  //     };
}
