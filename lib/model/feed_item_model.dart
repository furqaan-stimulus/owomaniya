// To parse this JSON data, do
//
//     final feedItemModel = feedItemModelFromJson(jsonString);

import 'dart:convert';

FeedItemModel feedItemModelFromJson(String str) => FeedItemModel.fromJson(json.decode(str));

String feedItemModelToJson(FeedItemModel data) => json.encode(data.toJson());

class FeedItemModel {
  FeedItemModel({
    this.status,
    this.data,
    this.links,
    this.meta,
  });

  bool status;
  List<Datum> data;
  Links links;
  Meta meta;

  factory FeedItemModel.fromJson(Map<String, dynamic> json) => FeedItemModel(
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
    this.feedTitle,
    this.feedUrl,
    this.feedDate,
    this.feedType,
    this.feedDetail,
    this.feedLikeCnt,
    this.feedCommentCnt,
    this.feedShareCnt,
    this.feedAttendanceCnt,
    this.feedRelateCnt,
    this.canComment,
    this.feedtypekey,
    this.bookmarked,
    this.liked,
    this.attending,
    this.relate,
    this.paymentdone,
    this.details,
    this.media,
    this.categorymapping,
    this.feedqueryassigned,
  });

  int id;
  String feedTitle;
  String feedUrl;
  DateTime feedDate;
  FeedType feedType;
  String feedDetail;
  int feedLikeCnt;
  int feedCommentCnt;
  int feedShareCnt;
  int feedAttendanceCnt;
  int feedRelateCnt;
  CanComment canComment;
  String feedtypekey;
  bool bookmarked;
  bool liked;
  bool attending;
  bool relate;
  String paymentdone;
  Details details;
  List<Media> media;
  List<Categorymapping> categorymapping;
  List<Feedqueryassigned> feedqueryassigned;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    feedTitle: json["feed_title"],
    feedUrl: json["feed_url"],
    feedDate: DateTime.parse(json["feed_date"]),
    feedType: feedTypeValues.map[json["feed_type"]],
    feedDetail: json["feed_detail"],
    feedLikeCnt: json["feed_like_cnt"],
    feedCommentCnt: json["feed_comment_cnt"],
    feedShareCnt: json["feed_share_cnt"],
    feedAttendanceCnt: json["feed_attendance_cnt"],
    feedRelateCnt: json["feed_relate_cnt"],
    canComment: canCommentValues.map[json["can_comment"]],
    feedtypekey: json["feedtypekey"],
    bookmarked: json["bookmarked"],
    liked: json["liked"],
    attending: json["attending"],
    relate: json["relate"],
    paymentdone: json["paymentdone"],
    details: Details.fromJson(json["details"]),
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
    categorymapping: List<Categorymapping>.from(json["categorymapping"].map((x) => Categorymapping.fromJson(x))),
    feedqueryassigned: List<Feedqueryassigned>.from(json["feedqueryassigned"].map((x) => Feedqueryassigned.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "feed_title": feedTitle,
    "feed_url": feedUrl,
    "feed_date": feedDate.toIso8601String(),
    "feed_type": feedTypeValues.reverse[feedType],
    "feed_detail": feedDetail,
    "feed_like_cnt": feedLikeCnt,
    "feed_comment_cnt": feedCommentCnt,
    "feed_share_cnt": feedShareCnt,
    "feed_attendance_cnt": feedAttendanceCnt,
    "feed_relate_cnt": feedRelateCnt,
    "can_comment": canCommentValues.reverse[canComment],
    "feedtypekey": feedtypekey,
    "bookmarked": bookmarked,
    "liked": liked,
    "attending": attending,
    "relate": relate,
    "paymentdone": paymentdone,
    "details": details.toJson(),
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
    "categorymapping": List<dynamic>.from(categorymapping.map((x) => x.toJson())),
    "feedqueryassigned": List<dynamic>.from(feedqueryassigned.map((x) => x.toJson())),
  };
}

enum CanComment { Y }

final canCommentValues = EnumValues({
  "Y": CanComment.Y
});

class Categorymapping {
  Categorymapping({
    this.updatedAt,
    this.category,
  });

  DateTime updatedAt;
  Category category;

  factory Categorymapping.fromJson(Map<String, dynamic> json) => Categorymapping(
    updatedAt: DateTime.parse(json["updated_at"]),
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
    "category": category.toJson(),
  };
}

class Category {
  Category({
    this.id,
    this.category,
    this.iconPath,
  });

  int id;
  String category;
  String iconPath;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    category: json["category"],
    iconPath: json["icon_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "icon_path": iconPath,
  };
}

class Details {
  Details({
    this.authordetails,
    this.otherdetails,
  });

  List<DetailsAuthordetail> authordetails;
  List<dynamic> otherdetails;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    authordetails: List<DetailsAuthordetail>.from(json["authordetails"].map((x) => DetailsAuthordetail.fromJson(x))),
    otherdetails: List<dynamic>.from(json["otherdetails"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "authordetails": List<dynamic>.from(authordetails.map((x) => x.toJson())),
    "otherdetails": List<dynamic>.from(otherdetails.map((x) => x)),
  };
}

class DetailsAuthordetail {
  DetailsAuthordetail({
    this.id,
    this.feedsId,
    this.usersId,
    this.isPrimary,
    this.updatedAt,
    this.user,
  });

  int id;
  int feedsId;
  int usersId;
  String isPrimary;
  DateTime updatedAt;
  User user;

  factory DetailsAuthordetail.fromJson(Map<String, dynamic> json) => DetailsAuthordetail(
    id: json["id"] == null ? null : json["id"],
    feedsId: json["feeds_id"] == null ? null : json["feeds_id"],
    usersId: json["users_id"] == null ? null : json["users_id"],
    isPrimary: json["is_primary"] == null ? null : json["is_primary"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "feeds_id": feedsId == null ? null : feedsId,
    "users_id": usersId == null ? null : usersId,
    "is_primary": isPrimary == null ? null : isPrimary,
    "updated_at": updatedAt == null ? null : "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
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
    this.userImage,
    this.uploadUrl,
    this.authordetails,
    this.queryPrice,
    this.expertexpertisemapping,
    this.expertdetails,
  });

  String firstName;
  String emailAddress;
  String lastName;
  String mobileNo;
  int id;
  String userImage;
  String uploadUrl;
  List<UserAuthordetail> authordetails;
  String queryPrice;
  List<Expertexpertisemapping> expertexpertisemapping;
  Expertdetails expertdetails;

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["first_name"],
    emailAddress: json["email_address"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
    id: json["id"],
    userImage: json["user_image"],
    uploadUrl: json["upload_url"] == null ? null : json["upload_url"],
    authordetails: List<UserAuthordetail>.from(json["authordetails"].map((x) => UserAuthordetail.fromJson(x))),
    queryPrice: json["query_price"] == null ? null : json["query_price"],
    expertexpertisemapping: json["expertexpertisemapping"] == null ? null : List<Expertexpertisemapping>.from(json["expertexpertisemapping"].map((x) => Expertexpertisemapping.fromJson(x))),
    expertdetails: json["expertdetails"] == null ? null : Expertdetails.fromJson(json["expertdetails"]),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "email_address": emailAddress,
    "last_name": lastName == null ? null : lastName,
    "mobile_no": mobileNo == null ? null : mobileNo,
    "id": id,
    "user_image": userImage,
    "upload_url": uploadUrl == null ? null : uploadUrl,
    "authordetails": List<dynamic>.from(authordetails.map((x) => x.toJson())),
    "query_price": queryPrice == null ? null : queryPrice,
    "expertexpertisemapping": expertexpertisemapping == null ? null : List<dynamic>.from(expertexpertisemapping.map((x) => x.toJson())),
    "expertdetails": expertdetails == null ? null : expertdetails.toJson(),
  };
}

class UserAuthordetail {
  UserAuthordetail({
    this.id,
    this.usersId,
    this.userRoleId,
    this.introduction,
    this.brief,
    this.facebookLink,
    this.twitterLink,
    this.website,
    this.prefix,
    this.updatedAt,
  });

  int id;
  int usersId;
  int userRoleId;
  String introduction;
  String brief;
  String facebookLink;
  String twitterLink;
  String website;
  Prefix prefix;
  DateTime updatedAt;

  factory UserAuthordetail.fromJson(Map<String, dynamic> json) => UserAuthordetail(
    id: json["id"],
    usersId: json["users_id"],
    userRoleId: json["user_role_id"],
    introduction: json["introduction"],
    brief: json["brief"] == null ? null : json["brief"],
    facebookLink: json["facebook_link"] == null ? null : json["facebook_link"],
    twitterLink: json["twitter_link"] == null ? null : json["twitter_link"],
    website: json["website"] == null ? null : json["website"],
    prefix: prefixValues.map[json["prefix"]],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "users_id": usersId,
    "user_role_id": userRoleId,
    "introduction": introduction,
    "brief": brief == null ? null : brief,
    "facebook_link": facebookLink == null ? null : facebookLink,
    "twitter_link": twitterLink == null ? null : twitterLink,
    "website": website == null ? null : website,
    "prefix": prefixValues.reverse[prefix],
    "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
  };
}

enum Prefix { EMPTY, MR, MISS }

final prefixValues = EnumValues({
  "": Prefix.EMPTY,
  "Miss.": Prefix.MISS,
  "Mr.": Prefix.MR
});

class Expertdetails {
  Expertdetails({
    this.id,
    this.userExpertExp,
  });

  int id;
  int userExpertExp;

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
    "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
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

enum FeedType { ARTICLE, QUERY }

final feedTypeValues = EnumValues({
  "Article": FeedType.ARTICLE,
  "Query": FeedType.QUERY
});

class Feedqueryassigned {
  Feedqueryassigned({
    this.id,
    this.feedsId,
    this.assignedUserExpertId,
    this.feedStatus,
    this.intialUserExpertId,
    this.totalfollowups,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.latestanswer,
    this.assignedexpert,
  });

  int id;
  int feedsId;
  int assignedUserExpertId;
  String feedStatus;
  dynamic intialUserExpertId;
  int totalfollowups;
  DateTime createdAt;
  int createdBy;
  DateTime updatedAt;
  dynamic latestanswer;
  Assignedexpert assignedexpert;

  factory Feedqueryassigned.fromJson(Map<String, dynamic> json) => Feedqueryassigned(
    id: json["id"],
    feedsId: json["feeds_id"],
    assignedUserExpertId: json["assigned_user_expert_id"],
    feedStatus: json["feed_status"],
    intialUserExpertId: json["intial_user_expert_id"],
    totalfollowups: json["totalfollowups"],
    createdAt: DateTime.parse(json["created_at"]),
    createdBy: json["created_by"],
    updatedAt: DateTime.parse(json["updated_at"]),
    latestanswer: json["latestanswer"],
    assignedexpert: Assignedexpert.fromJson(json["assignedexpert"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "feeds_id": feedsId,
    "assigned_user_expert_id": assignedUserExpertId,
    "feed_status": feedStatus,
    "intial_user_expert_id": intialUserExpertId,
    "totalfollowups": totalfollowups,
    "created_at": createdAt.toIso8601String(),
    "created_by": createdBy,
    "updated_at": updatedAt.toIso8601String(),
    "latestanswer": latestanswer,
    "assignedexpert": assignedexpert.toJson(),
  };
}

class Assignedexpert {
  Assignedexpert({
    this.id,
    this.emailAddress,
    this.mobileNo,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.maritalStatus,
    this.city,
    this.state,
    this.country,
    this.userImage,
    this.healthDetails,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userDevicesId,
    this.pgAmount,
    this.reasonForSuspension,
    this.flagged,
    this.flagNote,
    this.userUrl,
    this.uploadUrl,
    this.verifiedMobile,
    this.verifiedEmail,
  });

  int id;
  String emailAddress;
  String mobileNo;
  String firstName;
  String lastName;
  DateTime dateOfBirth;
  String gender;
  String maritalStatus;
  String city;
  dynamic state;
  dynamic country;
  String userImage;
  HealthDetails healthDetails;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int userDevicesId;
  int pgAmount;
  dynamic reasonForSuspension;
  String flagged;
  dynamic flagNote;
  String userUrl;
  String uploadUrl;
  int verifiedMobile;
  int verifiedEmail;

  factory Assignedexpert.fromJson(Map<String, dynamic> json) => Assignedexpert(
    id: json["id"],
    emailAddress: json["email_address"],
    mobileNo: json["mobile_no"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    gender: json["gender"],
    maritalStatus: json["marital_status"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    userImage: json["user_image"],
    healthDetails: HealthDetails.fromJson(json["health_details"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    userDevicesId: json["user_devices_id"],
    pgAmount: json["pg_amount"],
    reasonForSuspension: json["reason_for_suspension"],
    flagged: json["flagged"],
    flagNote: json["flag_note"],
    userUrl: json["user_url"],
    uploadUrl: json["upload_url"],
    verifiedMobile: json["verified_mobile"],
    verifiedEmail: json["verified_email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email_address": emailAddress,
    "mobile_no": mobileNo,
    "first_name": firstName,
    "last_name": lastName,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "marital_status": maritalStatus,
    "city": city,
    "state": state,
    "country": country,
    "user_image": userImage,
    "health_details": healthDetails.toJson(),
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
    "deleted_at": deletedAt,
    "user_devices_id": userDevicesId,
    "pg_amount": pgAmount,
    "reason_for_suspension": reasonForSuspension,
    "flagged": flagged,
    "flag_note": flagNote,
    "user_url": userUrl,
    "upload_url": uploadUrl,
    "verified_mobile": verifiedMobile,
    "verified_email": verifiedEmail,
  };
}

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
    height: json["height"],
    weight: json["weight"],
    heightunit: json["heightunit"],
    weightunit: json["weightunit"],
    bloodGroup: json["blood_group"],
    bmi: json["bmi"],
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

class Media {
  Media({
    this.id,
    this.mediaType,
    this.mediaPath,
    this.updatedAt,
    this.feedsId,
  });

  int id;
  MediaType mediaType;
  String mediaPath;
  DateTime updatedAt;
  int feedsId;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    mediaType: mediaTypeValues.map[json["media_type"]],
    mediaPath: json["media_path"],
    updatedAt: DateTime.parse(json["updated_at"]),
    feedsId: json["feeds_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "media_type": mediaTypeValues.reverse[mediaType],
    "media_path": mediaPath,
    "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
    "feeds_id": feedsId,
  };
}

enum MediaType { COVER_IMAGE }

final mediaTypeValues = EnumValues({
  "cover_image": MediaType.COVER_IMAGE
});

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
  String next;

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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
