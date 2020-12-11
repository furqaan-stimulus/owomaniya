import 'package:owomaniya/model/details_author_detail.dart';

class Details {
  Details({
    this.authordetails,
    this.otherdetails,
  });

  List<DetailsAuthordetail> authordetails;
  List<dynamic> otherdetails;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        authordetails:
            List<DetailsAuthordetail>.from(json["authordetails"].map((x) => DetailsAuthordetail.fromJson(x))),
        otherdetails: List<dynamic>.from(json["otherdetails"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "authordetails": List<dynamic>.from(authordetails.map((x) => x.toJson())),
        "otherdetails": List<dynamic>.from(otherdetails.map((x) => x)),
      };
}
