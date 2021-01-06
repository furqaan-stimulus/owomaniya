// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map json) {
  return Category(
    id: json['id'] as int,
    category: json['category'] as String,
    iconPath: json['icon_path'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'icon_path': instance.iconPath,
    };
