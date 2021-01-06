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
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    feedsId: json['feeds_id'] as int,
  );
}

Map<String, dynamic> _$FeedMediaToJson(FeedMedia instance) => <String, dynamic>{
      'id': instance.id,
      'media_type': _$MediaTypeEnumMap[instance.mediaType],
      'media_path': instance.mediaPath,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'feeds_id': instance.feedsId,
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
  MediaType.COVER_IMAGE: 'COVER_IMAGE',
  MediaType.VIDEO: 'VIDEO',
  MediaType.IMAGE: 'IMAGE',
};
