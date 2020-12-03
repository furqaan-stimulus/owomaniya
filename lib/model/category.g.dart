// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map json) {
  return Category(
    id: json['id'] as int,
    category: json['category'] as String,
    feedCategoryDesc: json['feed_category_desc'] as String,
    iconPath: json['icon_path'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    createdBy: json['created_by'] as int,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    updatedBy: json['updated_by'] as int,
    deletedAt: json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String),
    categoryUrl: json['category_url'] as String,
    bannerImage: json['banner_image'] as String,
    bannerTitle: json['banner_title'] as String,
    bannerSubtitle: json['banner_subtitle'] as String,
    categoryInfoTitle: json['category_info_title'] as String,
    categoryShortInfo: json['category_short_info'] as String,
    categoryLongInfo: json['category_long_info'] as String,
    categoryInfoImg: json['category_info_img'] as String,
    metaTitle: json['meta_title'] as String,
    metaDesc: json['meta_desc'] as String,
    metaOgImage: json['meta_og_image'] as String,
    metaKeyword: json['meta_keyword'] as String,
    categorySnippet: json['category_snippet'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'feed_category_desc': instance.feedCategoryDesc,
      'icon_path': instance.iconPath,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'category_url': instance.categoryUrl,
      'banner_image': instance.bannerImage,
      'banner_title': instance.bannerTitle,
      'banner_subtitle': instance.bannerSubtitle,
      'category_info_title': instance.categoryInfoTitle,
      'category_short_info': instance.categoryShortInfo,
      'category_long_info': instance.categoryLongInfo,
      'category_info_img': instance.categoryInfoImg,
      'meta_title': instance.metaTitle,
      'meta_desc': instance.metaDesc,
      'meta_og_image': instance.metaOgImage,
      'meta_keyword': instance.metaKeyword,
      'category_snippet': instance.categorySnippet,
    };
