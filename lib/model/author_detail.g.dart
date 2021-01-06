// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorDetail _$AuthorDetailFromJson(Map json) {
  return AuthorDetail(
    id: json['id'] as int,
    feedsId: json['feeds_id'] as int,
    usersId: json['users_id'] as int,
    isPrimary: json['is_primary'] as String,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    user: json['user'] == null
        ? null
        : User.fromJson((json['user'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$AuthorDetailToJson(AuthorDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feeds_id': instance.feedsId,
      'users_id': instance.usersId,
      'is_primary': instance.isPrimary,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user': instance.user?.toJson(),
    };
