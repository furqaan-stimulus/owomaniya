// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryMapping _$CategoryMappingFromJson(Map json) {
  return CategoryMapping(
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    category: json['category'] == null
        ? null
        : Category.fromJson((json['category'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$CategoryMappingToJson(CategoryMapping instance) =>
    <String, dynamic>{
      'updated_at': instance.updatedAt?.toIso8601String(),
      'category': instance.category?.toJson(),
    };
