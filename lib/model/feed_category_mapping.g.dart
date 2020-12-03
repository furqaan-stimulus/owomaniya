// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_category_mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedCategoryMapping _$FeedCategoryMappingFromJson(Map json) {
  return FeedCategoryMapping(
    id: json['id'] as int,
    feedsId: json['feeds_id'] as int,
    categoryId: json['category_id'] == null
        ? null
        : Category.fromJson((json['category_id'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
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
    feed: json['feed'] == null
        ? null
        : Feeds.fromJson((json['feed'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    category: json['category'] == null
        ? null
        : Category.fromJson((json['category'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$FeedCategoryMappingToJson(
        FeedCategoryMapping instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feeds_id': instance.feedsId,
      'category_id': instance.categoryId?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'feed': instance.feed?.toJson(),
      'category': instance.category?.toJson(),
    };
