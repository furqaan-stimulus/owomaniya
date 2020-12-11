// To parse this JSON data, do
//
//     final queryConsultationModel = queryConsultationModelFromJson(jsonString);

import 'dart:convert';

QueryConsultationModel queryConsultationModelFromJson(String str) =>
    QueryConsultationModel.fromJson(json.decode(str));

String queryConsultationModelToJson(QueryConsultationModel data) => json.encode(data.toJson());

class QueryConsultationModel {
  QueryConsultationModel({
    this.status,
    this.data,
    this.links,
    this.meta,
  });

  bool status;
  List<Datum> data;
  Links links;
  Meta meta;

  factory QueryConsultationModel.fromJson(Map<String, dynamic> json) => QueryConsultationModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.feedUrl,
    this.feedTitle,
    this.feedDate,
    this.feedCommentCnt,
    this.feedRelateCnt,
    this.feedType,
    this.bookmarked,
    this.liked,
    this.attending,
    this.relate,
    this.paymentdone,
    this.details,
    this.categorymapping,
    this.feedqueryassigned,
    this.queryOrder,
  });

  int id;
  String feedUrl;
  String feedTitle;
  DateTime feedDate;
  int feedCommentCnt;
  int feedRelateCnt;
  String feedType;
  bool bookmarked;
  bool liked;
  bool attending;
  bool relate;
  String paymentdone;
  Details details;
  List<dynamic> categorymapping;
  List<Feedqueryassigned> feedqueryassigned;
  QueryOrder queryOrder;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        feedUrl: json["feed_url"],
        feedTitle: json["feed_title"],
        feedDate: DateTime.parse(json["feed_date"]),
        feedCommentCnt: json["feed_comment_cnt"],
        feedRelateCnt: json["feed_relate_cnt"],
        feedType: json["feed_type"],
        bookmarked: json["bookmarked"],
        liked: json["liked"],
        attending: json["attending"],
        relate: json["relate"],
        paymentdone: json["paymentdone"],
        details: Details.fromJson(json["details"]),
        categorymapping: List<dynamic>.from(json["categorymapping"].map((x) => x)),
        feedqueryassigned:
            List<Feedqueryassigned>.from(json["feedqueryassigned"].map((x) => Feedqueryassigned.fromJson(x))),
        queryOrder: QueryOrder.fromJson(json["query_order"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "feed_url": feedUrl,
        "feed_title": feedTitle,
        "feed_date": feedDate.toIso8601String(),
        "feed_comment_cnt": feedCommentCnt,
        "feed_relate_cnt": feedRelateCnt,
        "feed_type": feedType,
        "bookmarked": bookmarked,
        "liked": liked,
        "attending": attending,
        "relate": relate,
        "paymentdone": paymentdone,
        "details": details.toJson(),
        "categorymapping": List<dynamic>.from(categorymapping.map((x) => x)),
        "feedqueryassigned": List<dynamic>.from(feedqueryassigned.map((x) => x.toJson())),
        "query_order": queryOrder.toJson(),
      };
}

class Details {
  Details({
    this.authordetails,
    this.otherdetails,
  });

  List<Authordetail> authordetails;
  List<dynamic> otherdetails;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        authordetails: List<Authordetail>.from(json["authordetails"].map((x) => Authordetail.fromJson(x))),
        otherdetails: List<dynamic>.from(json["otherdetails"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "authordetails": List<dynamic>.from(authordetails.map((x) => x.toJson())),
        "otherdetails": List<dynamic>.from(otherdetails.map((x) => x)),
      };
}

class Authordetail {
  Authordetail({
    this.user,
  });

  User user;

  factory Authordetail.fromJson(Map<String, dynamic> json) => Authordetail(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    this.firstName,
    this.emailAddress,
    this.lastName,
    this.mobileNo,
    this.id,
    this.uploadUrl,
    this.userImage,
    this.queryPrice,
    this.authordetails,
    this.expertexpertisemapping,
    this.expertdetails,
  });

  String firstName;
  String emailAddress;
  String lastName;
  String mobileNo;
  int id;
  String uploadUrl;
  String userImage;
  String queryPrice;
  List<dynamic> authordetails;
  List<Expertexpertisemapping> expertexpertisemapping;
  Expertdetails expertdetails;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        emailAddress: json["email_address"],
        lastName: json["last_name"],
        mobileNo: json["mobile_no"],
        id: json["id"],
        uploadUrl: json["upload_url"],
        userImage: json["user_image"],
        queryPrice: json["query_price"],
        authordetails: List<dynamic>.from(json["authordetails"].map((x) => x)),
        expertexpertisemapping: List<Expertexpertisemapping>.from(
            json["expertexpertisemapping"].map((x) => Expertexpertisemapping.fromJson(x))),
        expertdetails: Expertdetails.fromJson(json["expertdetails"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "email_address": emailAddress,
        "last_name": lastName,
        "mobile_no": mobileNo,
        "id": id,
        "upload_url": uploadUrl,
        "user_image": userImage,
        "query_price": queryPrice,
        "authordetails": List<dynamic>.from(authordetails.map((x) => x)),
        "expertexpertisemapping": List<dynamic>.from(expertexpertisemapping.map((x) => x.toJson())),
        "expertdetails": expertdetails.toJson(),
      };
}

class Expertdetails {
  Expertdetails({
    this.id,
    this.userExpertExp,
  });

  int id;
  dynamic userExpertExp;

  factory Expertdetails.fromJson(Map<String, dynamic> json) => Expertdetails(
        id: json["id"],
        userExpertExp: json["user_expert_exp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_expert_exp": userExpertExp,
      };
}

class Expertexpertisemapping {
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
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "parentexpertise": parentexpertise.toJson(),
      };
}

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

class Feedqueryassigned {
  Feedqueryassigned({
    this.id,
    this.feedsId,
    this.feedStatus,
    this.latestanswer,
    this.assignedexpert,
  });

  int id;
  int feedsId;
  String feedStatus;
  dynamic latestanswer;
  dynamic assignedexpert;

  factory Feedqueryassigned.fromJson(Map<String, dynamic> json) => Feedqueryassigned(
        id: json["id"],
        feedsId: json["feeds_id"],
        feedStatus: json["feed_status"],
        latestanswer: json["latestanswer"],
        assignedexpert: json["assignedexpert"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "feeds_id": feedsId,
        "feed_status": feedStatus,
        "latestanswer": latestanswer,
        "assignedexpert": assignedexpert,
      };
}

class QueryOrder {
  QueryOrder({
    this.id,
    this.feedsId,
    this.queryPrice,
  });

  int id;
  int feedsId;
  int queryPrice;

  factory QueryOrder.fromJson(Map<String, dynamic> json) => QueryOrder(
        id: json["id"],
        feedsId: json["feeds_id"],
        queryPrice: json["query_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "feeds_id": feedsId,
        "query_price": queryPrice,
      };
}

class Links {
  Links({
    this.self,
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String self;
  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

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

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
