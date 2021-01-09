// To parse this JSON data, do
//
//     final feedQueryDetails = feedQueryDetailsFromJson(jsonString);

import 'dart:convert';

FeedQueryDetails feedQueryDetailsFromJson(String str) =>
    FeedQueryDetails.fromJson(json.decode(str));

String feedQueryDetailsToJson(FeedQueryDetails data) => json.encode(data.toJson());

class FeedQueryDetails {
  FeedQueryDetails({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory FeedQueryDetails.fromJson(Map<String, dynamic> json) => FeedQueryDetails(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.feedTitle,
    this.feedType,
    this.feedDate,
    this.feedStatus,
    this.feedDetail,
    this.feedHidden,
    this.feedUser,
    this.updatedAt,
    this.feedLikeCount,
    this.feedCommentCnt,
    this.feedShareCnt,
    this.feedAttendanceCnt,
    this.feedRelateCnt,
    this.canComment,
    this.endDate,
    this.payment,
    this.bookmarked,
    this.relate,
    this.liked,
    this.attending,
    this.feedUrl,
    this.feedComments,
    this.feedAuthors,
    this.relatedFeed,
    this.assignedexperts,
    this.notifiedexperts,
    this.remainingexperts,
    this.categories,
    this.image,
    this.userconversation,
  });

  int id;
  String feedTitle;
  String feedType;
  DateTime feedDate;
  String feedStatus;
  String feedDetail;
  String feedHidden;
  int feedUser;
  DateTime updatedAt;
  int feedLikeCount;
  int feedCommentCnt;
  int feedShareCnt;
  int feedAttendanceCnt;
  int feedRelateCnt;
  String canComment;
  dynamic endDate;
  String payment;
  bool bookmarked;
  bool relate;
  bool liked;
  bool attending;
  String feedUrl;
  List<FeedComment> feedComments;
  List<FeedAuthor> feedAuthors;
  List<RelatedFeed> relatedFeed;
  List<Assignedexpert> assignedexperts;
  List<Notifiedexpert> notifiedexperts;
  List<Remainingexpert> remainingexperts;
  List<CategoryElement> categories;
  List<dynamic> image;
  String userconversation;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        feedTitle: json["feed_title"],
        feedType: json["feed_type"],
        feedDate: DateTime.parse(json["feed_date"]),
        feedStatus: json["feed_status"],
        feedDetail: json["feed_detail"],
        feedHidden: json["feed_hidden"],
        feedUser: json["feed_user"],
        updatedAt: DateTime.parse(json["updated_at"]),
        feedLikeCount: json["feed_like_count"],
        feedCommentCnt: json["feed_comment_cnt"],
        feedShareCnt: json["feed_share_cnt"],
        feedAttendanceCnt: json["feed_attendance_cnt"],
        feedRelateCnt: json["feed_relate_cnt"],
        canComment: json["can_comment"],
        endDate: json["end_date"],
        payment: json["payment"],
        bookmarked: json["bookmarked"],
        relate: json["relate"],
        liked: json["liked"],
        attending: json["attending"],
        feedUrl: json["feed_url"],
        feedComments:
            List<FeedComment>.from(json["feed_comments"].map((x) => FeedComment.fromJson(x))),
        feedAuthors: List<FeedAuthor>.from(json["feed_authors"].map((x) => FeedAuthor.fromJson(x))),
        relatedFeed:
            List<RelatedFeed>.from(json["related_feed"].map((x) => RelatedFeed.fromJson(x))),
        assignedexperts: List<Assignedexpert>.from(
            json["assignedexperts"].map((x) => Assignedexpert.fromJson(x))),
        notifiedexperts: List<Notifiedexpert>.from(
            json["notifiedexperts"].map((x) => Notifiedexpert.fromJson(x))),
        remainingexperts: List<Remainingexpert>.from(
            json["remainingexperts"].map((x) => Remainingexpert.fromJson(x))),
        categories:
            List<CategoryElement>.from(json["categories"].map((x) => CategoryElement.fromJson(x))),
        image: List<dynamic>.from(json["image"].map((x) => x)),
        userconversation: json["userconversation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "feed_title": feedTitle,
        "feed_type": feedType,
        "feed_date": feedDate.toIso8601String(),
        "feed_status": feedStatus,
        "feed_detail": feedDetail,
        "feed_hidden": feedHidden,
        "feed_user": feedUser,
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "feed_like_count": feedLikeCount,
        "feed_comment_cnt": feedCommentCnt,
        "feed_share_cnt": feedShareCnt,
        "feed_attendance_cnt": feedAttendanceCnt,
        "feed_relate_cnt": feedRelateCnt,
        "can_comment": canComment,
        "end_date": endDate,
        "payment": payment,
        "bookmarked": bookmarked,
        "relate": relate,
        "liked": liked,
        "attending": attending,
        "feed_url": feedUrl,
        "feed_comments": List<dynamic>.from(feedComments.map((x) => x.toJson())),
        "feed_authors": List<dynamic>.from(feedAuthors.map((x) => x.toJson())),
        "related_feed": List<dynamic>.from(relatedFeed.map((x) => x.toJson())),
        "assignedexperts": List<dynamic>.from(assignedexperts.map((x) => x.toJson())),
        "notifiedexperts": List<dynamic>.from(notifiedexperts.map((x) => x.toJson())),
        "remainingexperts": List<dynamic>.from(remainingexperts.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "image": List<dynamic>.from(image.map((x) => x)),
        "userconversation": userconversation,
      };
}

class Assignedexpert {
  Assignedexpert({
    this.feedStatus,
    this.totalfollowups,
    this.userId,
    this.expertname,
    this.payment,
    this.queryAnswers,
  });

  String feedStatus;
  int totalfollowups;
  int userId;
  String expertname;
  String payment;
  List<QueryAnswer> queryAnswers;

  factory Assignedexpert.fromJson(Map<String, dynamic> json) => Assignedexpert(
        feedStatus: json["feed_status"],
        totalfollowups: json["totalfollowups"],
        userId: json["user_id"],
        expertname: json["expertname"],
        payment: json["payment"],
        queryAnswers:
            List<QueryAnswer>.from(json["query_answers"].map((x) => QueryAnswer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "feed_status": feedStatus,
        "totalfollowups": totalfollowups,
        "user_id": userId,
        "expertname": expertname,
        "payment": payment,
        "query_answers": List<dynamic>.from(queryAnswers.map((x) => x.toJson())),
      };
}

class QueryAnswer {
  QueryAnswer({
    this.id,
    this.vissibility,
    this.comment,
    this.isAnonymous,
    this.updatedAt,
    this.createdAt,
    this.userDevicesId,
    this.feedQueryCommentsId,
    this.type,
    this.devicetype,
    this.user,
  });

  int id;
  String vissibility;
  String comment;
  String isAnonymous;
  DateTime updatedAt;
  DateTime createdAt;
  int userDevicesId;
  int feedQueryCommentsId;
  int type;
  Devicetype devicetype;
  User user;

  factory QueryAnswer.fromJson(Map<String, dynamic> json) => QueryAnswer(
        id: json["id"],
        vissibility: json["vissibility"],
        comment: json["comment"],
        isAnonymous: json["is_anonymous"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        userDevicesId: json["user_devices_id"],
        feedQueryCommentsId: json["feed_query_comments_id"],
        type: json["type"],
        devicetype: Devicetype.fromJson(json["devicetype"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vissibility": vissibility,
        "comment": comment,
        "is_anonymous": isAnonymous,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "user_devices_id": userDevicesId,
        "feed_query_comments_id": feedQueryCommentsId,
        "type": type,
        "devicetype": devicetype.toJson(),
        "user": user.toJson(),
      };
}

class Devicetype {
  Devicetype({
    this.deviceType,
    this.deviceOs,
  });

  String deviceType;
  String deviceOs;

  factory Devicetype.fromJson(Map<String, dynamic> json) => Devicetype(
        deviceType: json["device_type"],
        deviceOs: json["device_os"],
      );

  Map<String, dynamic> toJson() => {
        "device_type": deviceType,
        "device_os": deviceOs,
      };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.gender,
    this.userImage,
  });

  int id;
  String firstName;
  String lastName;
  DateTime age;
  String gender;
  String userImage;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        age: json["age"] == null ? null : DateTime.parse(json["age"]),
        gender: json["gender"],
        userImage: json["user_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "age": age == null
            ? null
            : "${age.year.toString().padLeft(4, '0')}-${age.month.toString().padLeft(2, '0')}-${age.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "user_image": userImage,
      };
}

class CategoryElement {
  CategoryElement({
    this.updatedAt,
    this.category,
  });

  DateTime updatedAt;
  CategoryCategory category;

  factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
        updatedAt: DateTime.parse(json["updated_at"]),
        category: CategoryCategory.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "category": category.toJson(),
      };
}

class CategoryCategory {
  CategoryCategory({
    this.category,
    this.id,
    this.iconPath,
  });

  String category;
  int id;
  String iconPath;

  factory CategoryCategory.fromJson(Map<String, dynamic> json) => CategoryCategory(
        category: json["category"],
        id: json["id"],
        iconPath: json["icon_path"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "id": id,
        "icon_path": iconPath,
      };
}

class FeedAuthor {
  FeedAuthor({
    this.id,
    this.firstName,
    this.lastName,
    this.userImage,
    this.thanksCount,
    this.isFavourite,
    this.usersThanked,
    this.queryAnsweredCount,
    this.consultationFees,
    this.expertDetails,
    this.experties,
  });

  int id;
  String firstName;
  String lastName;
  String userImage;
  int thanksCount;
  bool isFavourite;
  bool usersThanked;
  int queryAnsweredCount;
  dynamic consultationFees;
  List<ExpertDetail> expertDetails;
  List<Experty> experties;

  factory FeedAuthor.fromJson(Map<String, dynamic> json) => FeedAuthor(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userImage: json["user_image"],
        thanksCount: json["thanks_count"],
        isFavourite: json["is_favourite"],
        usersThanked: json["users_thanked"],
        queryAnsweredCount: json["query_answered_count"],
        consultationFees: json["consultation_fees"],
        expertDetails:
            List<ExpertDetail>.from(json["expert_details"].map((x) => ExpertDetail.fromJson(x))),
        experties: List<Experty>.from(json["experties"].map((x) => Experty.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "user_image": userImage,
        "thanks_count": thanksCount,
        "is_favourite": isFavourite,
        "users_thanked": usersThanked,
        "query_answered_count": queryAnsweredCount,
        "consultation_fees": consultationFees,
        "expert_details": List<dynamic>.from(expertDetails.map((x) => x.toJson())),
        "experties": List<dynamic>.from(experties.map((x) => x.toJson())),
      };
}

class ExpertDetail {
  ExpertDetail({
    this.userExpertExp,
    this.userExpertQualification,
  });

  int userExpertExp;
  String userExpertQualification;

  factory ExpertDetail.fromJson(Map<String, dynamic> json) => ExpertDetail(
        userExpertExp: json["user_expert_exp"],
        userExpertQualification: json["user_expert_qualification"],
      );

  Map<String, dynamic> toJson() => {
        "user_expert_exp": userExpertExp,
        "user_expert_qualification": userExpertQualification,
      };
}

class Experty {
  Experty({
    this.updatedAt,
    this.parentexpertise,
  });

  DateTime updatedAt;
  Parentexpertise parentexpertise;

  factory Experty.fromJson(Map<String, dynamic> json) => Experty(
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

class FeedComment {
  FeedComment({
    this.id,
    this.usersId,
    this.comment,
    this.feedCommentsId,
    this.isAnonymous,
    this.createdAt,
    this.updatedAt,
    this.hidden,
    this.flagged,
    this.flagNote,
  });

  int id;
  User usersId;
  String comment;
  int feedCommentsId;
  String isAnonymous;
  DateTime createdAt;
  DateTime updatedAt;
  String hidden;
  String flagged;
  dynamic flagNote;

  factory FeedComment.fromJson(Map<String, dynamic> json) => FeedComment(
        id: json["id"],
        usersId: User.fromJson(json["users_id"]),
        comment: json["comment"],
        feedCommentsId: json["feed_comments_id"],
        isAnonymous: json["is_anonymous"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        hidden: json["hidden"],
        flagged: json["flagged"],
        flagNote: json["flag_note"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId.toJson(),
        "comment": comment,
        "feed_comments_id": feedCommentsId,
        "is_anonymous": isAnonymous,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "hidden": hidden,
        "flagged": flagged,
        "flag_note": flagNote,
      };
}

class Notifiedexpert {
  Notifiedexpert({
    this.userId,
    this.expertname,
  });

  int userId;
  String expertname;

  factory Notifiedexpert.fromJson(Map<String, dynamic> json) => Notifiedexpert(
        userId: json["user_id"],
        expertname: json["expertname"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "expertname": expertname,
      };
}

class RelatedFeed {
  RelatedFeed({
    this.feed,
  });

  List<Feed> feed;

  factory RelatedFeed.fromJson(Map<String, dynamic> json) => RelatedFeed(
        feed: List<Feed>.from(json["feed"].map((x) => Feed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "feed": List<dynamic>.from(feed.map((x) => x.toJson())),
      };
}

class Feed {
  Feed({
    this.id,
    this.feedTitle,
    this.feedType,
    this.feedDate,
    this.feedLikeCnt,
    this.feedCommentCnt,
    this.feedShareCnt,
    this.feedRelateCnt,
    this.feedAttendanceCnt,
    this.firstName,
    this.lastName,
    this.bookmarked,
    this.liked,
    this.attending,
    this.relate,
    this.paymentdone,
    this.categorymapping,
    this.media,
  });

  int id;
  String feedTitle;
  String feedType;
  DateTime feedDate;
  int feedLikeCnt;
  int feedCommentCnt;
  int feedShareCnt;
  int feedRelateCnt;
  int feedAttendanceCnt;
  String firstName;
  String lastName;
  bool bookmarked;
  bool liked;
  bool attending;
  bool relate;
  String paymentdone;
  List<Categorymapping> categorymapping;
  List<dynamic> media;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        id: json["id"],
        feedTitle: json["feed_title"],
        feedType: json["feed_type"],
        feedDate: DateTime.parse(json["feed_date"]),
        feedLikeCnt: json["feed_like_cnt"],
        feedCommentCnt: json["feed_comment_cnt"],
        feedShareCnt: json["feed_share_cnt"],
        feedRelateCnt: json["feed_relate_cnt"],
        feedAttendanceCnt: json["feed_attendance_cnt"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        bookmarked: json["bookmarked"],
        liked: json["liked"],
        attending: json["attending"],
        relate: json["relate"],
        paymentdone: json["paymentdone"],
        categorymapping: List<Categorymapping>.from(
            json["categorymapping"].map((x) => Categorymapping.fromJson(x))),
        media: List<dynamic>.from(json["media"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "feed_title": feedTitle,
        "feed_type": feedType,
        "feed_date": feedDate.toIso8601String(),
        "feed_like_cnt": feedLikeCnt,
        "feed_comment_cnt": feedCommentCnt,
        "feed_share_cnt": feedShareCnt,
        "feed_relate_cnt": feedRelateCnt,
        "feed_attendance_cnt": feedAttendanceCnt,
        "first_name": firstName,
        "last_name": lastName,
        "bookmarked": bookmarked,
        "liked": liked,
        "attending": attending,
        "relate": relate,
        "paymentdone": paymentdone,
        "categorymapping": List<dynamic>.from(categorymapping.map((x) => x.toJson())),
        "media": List<dynamic>.from(media.map((x) => x)),
      };
}

class Categorymapping {
  Categorymapping({
    this.updatedAt,
    this.category,
  });

  DateTime updatedAt;
  CategorymappingCategory category;

  factory Categorymapping.fromJson(Map<String, dynamic> json) => Categorymapping(
        updatedAt: DateTime.parse(json["updated_at"]),
        category: CategorymappingCategory.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "category": category.toJson(),
      };
}

class CategorymappingCategory {
  CategorymappingCategory({
    this.id,
    this.category,
    this.feedCategoryDesc,
    this.iconPath,
    this.updatedAt,
    this.categoryUrl,
    this.bannerImage,
    this.bannerTitle,
    this.bannerSubtitle,
    this.categoryInfoTitle,
    this.categoryShortInfo,
    this.categoryLongInfo,
    this.categoryInfoImg,
    this.metaTitle,
    this.metaDesc,
    this.metaOgImage,
    this.metaKeyword,
    this.categorySnippet,
  });

  int id;
  String category;
  dynamic feedCategoryDesc;
  String iconPath;
  DateTime updatedAt;
  String categoryUrl;
  String bannerImage;
  String bannerTitle;
  String bannerSubtitle;
  String categoryInfoTitle;
  String categoryShortInfo;
  dynamic categoryLongInfo;
  String categoryInfoImg;
  String metaTitle;
  String metaDesc;
  String metaOgImage;
  String metaKeyword;
  String categorySnippet;

  factory CategorymappingCategory.fromJson(Map<String, dynamic> json) => CategorymappingCategory(
        id: json["id"],
        category: json["category"],
        feedCategoryDesc: json["feed_category_desc"],
        iconPath: json["icon_path"],
        updatedAt: DateTime.parse(json["updated_at"]),
        categoryUrl: json["category_url"],
        bannerImage: json["banner_image"],
        bannerTitle: json["banner_title"],
        bannerSubtitle: json["banner_subtitle"],
        categoryInfoTitle: json["category_info_title"],
        categoryShortInfo: json["category_short_info"],
        categoryLongInfo: json["category_long_info"],
        categoryInfoImg: json["category_info_img"],
        metaTitle: json["meta_title"],
        metaDesc: json["meta_desc"],
        metaOgImage: json["meta_og_image"],
        metaKeyword: json["meta_keyword"],
        categorySnippet: json["category_snippet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "feed_category_desc": feedCategoryDesc,
        "icon_path": iconPath,
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "category_url": categoryUrl,
        "banner_image": bannerImage,
        "banner_title": bannerTitle,
        "banner_subtitle": bannerSubtitle,
        "category_info_title": categoryInfoTitle,
        "category_short_info": categoryShortInfo,
        "category_long_info": categoryLongInfo,
        "category_info_img": categoryInfoImg,
        "meta_title": metaTitle,
        "meta_desc": metaDesc,
        "meta_og_image": metaOgImage,
        "meta_keyword": metaKeyword,
        "category_snippet": categorySnippet,
      };
}

class Remainingexpert {
  Remainingexpert({
    this.userId,
    this.fullname,
  });

  int userId;
  String fullname;

  factory Remainingexpert.fromJson(Map<String, dynamic> json) => Remainingexpert(
        userId: json["user_id"],
        fullname: json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fullname": fullname,
      };
}
