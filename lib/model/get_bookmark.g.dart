// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookmark _$GetBookmarkFromJson(Map json) {
  return GetBookmark(
    id: json['id'] as int,
    usersId: json['users_id'] as int,
    feedsId: json['feeds_id'] as int,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    feed: json['feed'] == null
        ? null
        : Feed.fromJson((json['feed'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$GetBookmarkToJson(GetBookmark instance) =>
    <String, dynamic>{
      'id': instance.id,
      'users_id': instance.usersId,
      'feeds_id': instance.feedsId,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'feed': instance.feed?.toJson(),
    };
