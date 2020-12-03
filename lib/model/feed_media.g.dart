// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedMedia _$FeedMediaFromJson(Map json) {
  return FeedMedia(
    id: json['id'] as int,
    mediaType: _$enumDecodeNullable(_$MediaTypeEnumMap, json['media_type']),
    mediaPath: json['media_path'] as String,
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
    feedsId: json['feeds_id'] as int,
    feeds: json['feeds'] == null
        ? null
        : Feeds.fromJson((json['feeds'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$FeedMediaToJson(FeedMedia instance) => <String, dynamic>{
      'id': instance.id,
      'media_type': _$MediaTypeEnumMap[instance.mediaType],
      'media_path': instance.mediaPath,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'feeds_id': instance.feedsId,
      'feeds': instance.feeds?.toJson(),
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

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.video: 'video',
  MediaType.cover_image: 'cover_image',
};
