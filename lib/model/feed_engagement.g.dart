// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_engagement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedEngagement _$FeedEngagementFromJson(Map<String, dynamic> json) {
  return FeedEngagement(
    id: json['id'] as int,
    usersId: (json['users_id'] as List)
        ?.map(
            (e) => e == null ? null : Users.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    feedsId: (json['feeds_id'] as List)
        ?.map(
            (e) => e == null ? null : Feeds.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    engagementType:
        _$enumDecodeNullable(_$EngagementTypeEnumMap, json['engagement_type']),
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
  );
}

Map<String, dynamic> _$FeedEngagementToJson(FeedEngagement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feeds_id': instance.feedsId?.map((e) => e?.toJson())?.toList(),
      'users_id': instance.usersId?.map((e) => e?.toJson())?.toList(),
      'engagement_type': _$EngagementTypeEnumMap[instance.engagementType],
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt?.toIso8601String(),
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

const _$EngagementTypeEnumMap = {
  EngagementType.like: 'like',
  EngagementType.relate: 'relate',
  EngagementType.impression: 'impression',
};
