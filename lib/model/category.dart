import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true,includeIfNull: true,nullable: true,anyMap: true )
class Category {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'feed_category_desc')
  String feedCategoryDesc;

  @JsonKey(name: 'icon_path')
  String iconPath;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  @JsonKey(name: 'created_by')
  int createdBy;

  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  @JsonKey(name: 'updated_by')
  int updatedBy;

  @JsonKey(name: 'deleted_at')
  DateTime deletedAt;

  @JsonKey(name: 'category_url')
  String categoryUrl;

  @JsonKey(name: 'banner_image')
  String bannerImage;

  @JsonKey(name: 'banner_title')
  String bannerTitle;

  @JsonKey(name: 'banner_subtitle')
  String bannerSubtitle;

  @JsonKey(name: 'category_info_title')
  String categoryInfoTitle;

  @JsonKey(name: 'category_short_info')
  String categoryShortInfo;

  @JsonKey(name: 'category_long_info')
  String categoryLongInfo;

  @JsonKey(name: 'category_info_img')
  String categoryInfoImg;

  @JsonKey(name: 'meta_title')
  String metaTitle;

  @JsonKey(name: 'meta_desc')
  String metaDesc;

  @JsonKey(name: 'meta_og_image')
  String metaOgImage;

  @JsonKey(name: 'meta_keyword')
  String metaKeyword;

  @JsonKey(name: 'category_snippet')
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

  factory Category.fromJson(Map<String, dynamic> map) =>
      _$CategoryFromJson(map);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
