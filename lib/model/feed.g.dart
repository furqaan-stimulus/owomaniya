// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map json) {
  return Feed(
    id: json['id'] as int,
    feedTitle: json['feed_title'] as String,
    feedUrl: json['feed_url'] as String,
    feedDate: json['feed_date'] == null
        ? null
        : DateTime.parse(json['feed_date'] as String),
    feedType: json['feed_type'] as String,
    feedDetail: json['feed_detail'] as String,
    feedLikeCount: json['feed_like_count'] as int,
    feedCommentCount: json['feed_comment_count'] as int,
    feedShareCount: json['feed_share_count'] as int,
    feedAttendanceCount: json['feed_attendance_count'] as int,
    feedRelateCount: json['feed_relate_count'] as int,
    canComment: json['can_comment'] as String,
    feedTypeKey: json['feedtypekey'] as String,
    bookmarked: json['bookmarked'] as bool,
    liked: json['liked'] as bool,
    attending: json['attending'] as bool,
    relate: json['relate'] as bool,
    paymentDone: json['paymentdone'] as String,
    details: json['details'] == null
        ? null
        : Detail.fromJson((json['details'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    media: (json['media'] as List)
        ?.map((e) => e == null
            ? null
            : FeedMedia.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    categoryMapping: (json['categorymapping'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryMapping.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    feedQueryAssigned: (json['feedqueryassigned'] as List)
        ?.map((e) => e == null
            ? null
            : FeedQueryAssigned.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    feedEvent: json['feedevent'],
  )
    ..feedImpressionCount = json['feed_impression_count'] as int
    ..feedStatus = json['feed_status'] as String
    ..isAnonymous =
        _$enumDecodeNullable(_$IsAnonymousEnumMap, json['is_anonymous'])
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..createdBy = json['created_by'] as int
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..updatedBy = json['updated_by'] as int
    ..deletedAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String)
    ..userDevicesId = json['user_devices_id'] == null
        ? null
        : UserDevices.fromJson((json['user_devices_id'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          ))
    ..hidden = json['hidden'] as String
    ..endDate = json['end_date'] == null
        ? null
        : DateTime.parse(json['end_date'] as String)
    ..wpId = json['wp_id'] as int;
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'id': instance.id,
      'feed_title': instance.feedTitle,
      'feed_url': instance.feedUrl,
      'feed_date': instance.feedDate?.toIso8601String(),
      'feed_type': instance.feedType,
      'feed_detail': instance.feedDetail,
      'feed_like_count': instance.feedLikeCount,
      'feed_comment_count': instance.feedCommentCount,
      'feed_share_count': instance.feedShareCount,
      'feed_attendance_count': instance.feedAttendanceCount,
      'feed_relate_count': instance.feedRelateCount,
      'feed_impression_count': instance.feedImpressionCount,
      'feed_status': instance.feedStatus,
      'is_anonymous': _$IsAnonymousEnumMap[instance.isAnonymous],
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'user_devices_id': instance.userDevicesId?.toJson(),
      'hidden': instance.hidden,
      'can_comment': instance.canComment,
      'end_date': instance.endDate?.toIso8601String(),
      'feedtypekey': instance.feedTypeKey,
      'bookmarked': instance.bookmarked,
      'liked': instance.liked,
      'attending': instance.attending,
      'relate': instance.relate,
      'paymentdone': instance.paymentDone,
      'wp_id': instance.wpId,
      'details': instance.details?.toJson(),
      'media': instance.media?.map((e) => e?.toJson())?.toList(),
      'categorymapping':
          instance.categoryMapping?.map((e) => e?.toJson())?.toList(),
      'feedqueryassigned':
          instance.feedQueryAssigned?.map((e) => e?.toJson())?.toList(),
      'feedevent': instance.feedEvent,
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
