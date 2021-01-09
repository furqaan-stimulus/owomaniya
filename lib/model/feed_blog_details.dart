// To parse this JSON data, do
//
//     final feedDetails = feedDetailsFromJson(jsonString);

import 'dart:convert';

FeedBlogDetails feedDetailsFromJson(String str) => FeedBlogDetails.fromJson(json.decode(str));

String feedDetailsToJson(FeedBlogDetails data) => json.encode(data.toJson());

class FeedBlogDetails {
  FeedBlogDetails({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory FeedBlogDetails.fromJson(Map<String, dynamic> json) => FeedBlogDetails(
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
  List<dynamic> notifiedexperts;
  List<dynamic> remainingexperts;
  List<CategoryElement> categories;
  List<Image> image;
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
        notifiedexperts: List<dynamic>.from(json["notifiedexperts"].map((x) => x)),
        remainingexperts: List<dynamic>.from(json["remainingexperts"].map((x) => x)),
        categories:
            List<CategoryElement>.from(json["categories"].map((x) => CategoryElement.fromJson(x))),
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
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
        "notifiedexperts": List<dynamic>.from(notifiedexperts.map((x) => x)),
        "remainingexperts": List<dynamic>.from(remainingexperts.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
        "userconversation": userconversation,
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
    this.postCounts,
    this.thanksCount,
    this.isFavourite,
    this.usersThanked,
    this.authorinfo,
  });

  int id;
  String firstName;
  String lastName;
  String userImage;
  int postCounts;
  int thanksCount;
  bool isFavourite;
  bool usersThanked;
  Authorinfo authorinfo;

  factory FeedAuthor.fromJson(Map<String, dynamic> json) => FeedAuthor(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userImage: json["user_image"],
        postCounts: json["post_counts"],
        thanksCount: json["thanks_count"],
        isFavourite: json["is_favourite"],
        usersThanked: json["users_thanked"],
        authorinfo: Authorinfo.fromJson(json["authorinfo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "user_image": userImage,
        "post_counts": postCounts,
        "thanks_count": thanksCount,
        "is_favourite": isFavourite,
        "users_thanked": usersThanked,
        "authorinfo": authorinfo.toJson(),
      };
}

class Authorinfo {
  Authorinfo({
    this.userRoleId,
    this.introduction,
    this.brief,
    this.facebookLink,
    this.twitterLink,
    this.prefix,
    this.website,
  });

  int userRoleId;
  String introduction;
  String brief;
  String facebookLink;
  String twitterLink;
  String prefix;
  String website;

  factory Authorinfo.fromJson(Map<String, dynamic> json) => Authorinfo(
        userRoleId: json["user_role_id"],
        introduction: json["introduction"],
        brief: json["brief"],
        facebookLink: json["facebook_link"],
        twitterLink: json["twitter_link"],
        prefix: json["prefix"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "user_role_id": userRoleId,
        "introduction": introduction,
        "brief": brief,
        "facebook_link": facebookLink,
        "twitter_link": twitterLink,
        "prefix": prefix,
        "website": website,
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
  UsersId usersId;
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
        usersId: UsersId.fromJson(json["users_id"]),
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

class UsersId {
  UsersId({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.userImage,
  });

  int id;
  String firstName;
  String lastName;
  String gender;
  String userImage;

  factory UsersId.fromJson(Map<String, dynamic> json) => UsersId(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        userImage: json["user_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "user_image": userImage,
      };
}

class Image {
  Image({
    this.id,
    this.mediaType,
    this.mediaPath,
    this.updatedAt,
    this.feedsId,
  });

  int id;
  String mediaType;
  String mediaPath;
  DateTime updatedAt;
  int feedsId;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        mediaType: json["media_type"],
        mediaPath: json["media_path"],
        updatedAt: DateTime.parse(json["updated_at"]),
        feedsId: json["feeds_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "media_type": mediaType,
        "media_path": mediaPath,
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "feeds_id": feedsId,
      };
}

class RelatedFeed {
  RelatedFeed({
    this.feed,
  });

  List<dynamic> feed;

  factory RelatedFeed.fromJson(Map<String, dynamic> json) => RelatedFeed(
        feed: List<dynamic>.from(json["feed"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "feed": List<dynamic>.from(feed.map((x) => x)),
      };
}
