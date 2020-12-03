// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedComments _$FeedCommentsFromJson(Map json) {
  return FeedComments(
    id: json['id'] as int,
    feedsId: (json['feeds_id'] as List)
        ?.map((e) => e == null
            ? null
            : Feeds.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    usersId: (json['users_id'] as List)
        ?.map((e) => e == null
            ? null
            : Users.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    comment: json['comment'] as String,
    feedCommentsId: json['feed_comment_id'] as int,
    isAnonymous:
        _$enumDecodeNullable(_$IsAnonymousEnumMap, json['is_anonymous']),
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
    userDevicesId: (json['user_devices_id'] as List)
        ?.map((e) => e == null
            ? null
            : UserDevices.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    hidden: _$enumDecodeNullable(_$HiddenEnumMap, json['hidden']),
    flagged: _$enumDecodeNullable(_$FlaggedEnumMap, json['flagged']),
    flagNote: json['flag_note'] as String,
  );
}

Map<String, dynamic> _$FeedCommentsToJson(FeedComments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feeds_id': instance.feedsId?.map((e) => e?.toJson())?.toList(),
      'users_id': instance.usersId?.map((e) => e?.toJson())?.toList(),
      'comment': instance.comment,
      'feed_comment_id': instance.feedCommentsId,
      'is_anonymous': _$IsAnonymousEnumMap[instance.isAnonymous],
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'user_devices_id':
          instance.userDevicesId?.map((e) => e?.toJson())?.toList(),
      'hidden': _$HiddenEnumMap[instance.hidden],
      'flagged': _$FlaggedEnumMap[instance.flagged],
      'flag_note': instance.flagNote,
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

const _$IsAnonymousEnumMap = {
  IsAnonymous.Y: 'Y',
  IsAnonymous.N: 'N',
};

const _$HiddenEnumMap = {
  Hidden.Y: 'Y',
  Hidden.N: 'N',
};

const _$FlaggedEnumMap = {
  Flagged.Y: 'Y',
  Flagged.N: 'N',
};
