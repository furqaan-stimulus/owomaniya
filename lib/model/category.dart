
class Category {
  int id;
  String category;
  String iconPath;
  String feedCategoryDesc;
  DateTime createdAt;
  int createdBy;
  DateTime updatedAt;
  int updatedBy;
  DateTime deletedAt;
  String categoryUrl;
  String bannerImage;
  String bannerTitle;
  String bannerSubtitle;
  String categoryInfoTitle;
  String categoryShortInfo;
  String categoryLongInfo;
  String categoryInfoImg;
  String metaTitle;
  String metaDesc;
  String metaOgImage;
  String metaKeyword;
  String categorySnippet;

  Category({
    this.id,
    this.category,
    this.feedCategoryDesc,
    this.iconPath,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
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

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        category: json["category"],
        iconPath: json["icon_path"],
        feedCategoryDesc: json["feed_category_desc"],
        createdAt: json["created_at"],
        createdBy: json["created_by"],
        updatedAt: json["updated_at"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        categoryUrl: json["category_url"],
        bannerImage: json["banner_image"],
        bannerTitle: json["banner_title"],
        bannerSubtitle: json["banner_subtitle"],
        categoryInfoTitle: json["category_info_title"],
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
        "icon_path": iconPath,
        "feed_category_desc": feedCategoryDesc,
        "created_at": createdAt,
        "created_by": createdBy,
        "updated_at": updatedAt,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "category_url": categoryUrl,
        "banner_image": bannerImage,
        "banner_subtitle": bannerSubtitle,
        "category_info_title": categoryInfoTitle,
        "category_long_info": categoryLongInfo,
        "category_info_img": categoryInfoImg,
        "meta_title": metaTitle,
        "meta_desc": metaDesc,
        "meta_og_image": metaOgImage,
        "meta_keyword": metaKeyword,
        "category_snippet": categorySnippet,
      };
}
