// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedComments _$FeedCommentsFromJson(Map json) {
  return FeedComments(
    id: json['id'] as int,
    comment: json['comment'] as String,
    usersId: json['users_id'] as int,
    isAnonymous: json['is_anonymous'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    user: json['user'] == null
        ? null
        : User.fromJson((json['user'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$FeedCommentsToJson(FeedComments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'users_id': instance.usersId,
      'is_anonymous': instance.isAnonymous,
      'created_at': instance.createdAt?.toIso8601String(),
      'user': instance.user?.toJson(),
    };
