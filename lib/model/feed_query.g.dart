// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedQuery _$FeedQueryFromJson(Map<String, dynamic> json) {
  return FeedQuery(
    id: json['id'] as String,
    assignedUserExpertId: json['assign__user_expert_id'] as String,
    feedStatus: _$enumDecodeNullable(_$FeedStatusEnumMap, json['feed_status']),
    requestedTo: json['request_to'] as String,
    initialUserExpertId: json['initial_expert_id'] as String,
    feedQueryAnswered: json['feed_query_answered'] as String,
    totalFollowups: json['totalfollowups'] as String,
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

Map<String, dynamic> _$FeedQueryToJson(FeedQuery instance) => <String, dynamic>{
      'id': instance.id,
      'assign__user_expert_id': instance.assignedUserExpertId,
      'feed_status': _$FeedStatusEnumMap[instance.feedStatus],
      'request_to': instance.requestedTo,
      'initial_expert_id': instance.initialUserExpertId,
      'feed_query_answered': instance.feedQueryAnswered,
      'totalfollowups': instance.totalFollowups,
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

const _$FeedStatusEnumMap = {
  FeedStatus.active: 'active',
  FeedStatus.inactive: 'inactive',
  FeedStatus.draft: 'draft',
  FeedStatus.scheduled: 'scheduled',
};
