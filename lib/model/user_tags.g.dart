// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tags.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTags _$UserTagsFromJson(Map json) {
  return UserTags(
    id: json['id'] as int,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    createdBy: json['created_by'] as String,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    updatedBy: json['updated_by'] as String,
    deletedAt: json['deleted_at'],
    tagsId: json['tags_id'] as String,
    usersId: json['users_id'] as String,
  );
}

Map<String, dynamic> _$UserTagsToJson(UserTags instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'tags_id': instance.tagsId,
      'users_id': instance.usersId,
    };
