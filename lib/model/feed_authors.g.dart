// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_authors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedAuthors _$FeedAuthorsFromJson(Map json) {
  return FeedAuthors(
    id: json['id'] as int,
    feedsId: json['feeds_id'] as int,
    usersId: json['users_id'] as int,
    isPrimary: _$enumDecodeNullable(_$IsPrimaryEnumMap, json['is_primary']),
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
    user: json['user'] == null
        ? null
        : Users.fromJson((json['user'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    feed: json['feed'] == null
        ? null
        : Feeds.fromJson((json['feed'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$FeedAuthorsToJson(FeedAuthors instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feeds_id': instance.feedsId,
      'users_id': instance.usersId,
      'is_primary': _$IsPrimaryEnumMap[instance.isPrimary],
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'user': instance.user?.toJson(),
      'feed': instance.feed?.toJson(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$IsPrimaryEnumMap = {
  IsPrimary.Y: 'Y',
  IsPrimary.N: 'N',
};
