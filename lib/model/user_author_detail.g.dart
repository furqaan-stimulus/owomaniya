// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_author_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuthorDetail _$UserAuthorDetailFromJson(Map json) {
  return UserAuthorDetail(
    id: json['id'] as int,
    usersId: json['users_id'] as int,
    userRoleId: json['user_role_id'] as int,
    introduction: json['introduction'] as String,
    brief: json['brief'] as String,
    facebookLink: json['facebook_link'] as String,
    twitterLink: json['twitter_link'] as String,
    website: json['website'] as String,
    prefix: _$enumDecodeNullable(_$PrefixEnumMap, json['prefix']),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$UserAuthorDetailToJson(UserAuthorDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'users_id': instance.usersId,
      'user_role_id': instance.userRoleId,
      'introduction': instance.introduction,
      'brief': instance.brief,
      'facebook_link': instance.facebookLink,
      'twitter_link': instance.twitterLink,
      'website': instance.website,
      'prefix': _$PrefixEnumMap[instance.prefix],
      'updated_at': instance.updatedAt?.toIso8601String(),
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

const _$PrefixEnumMap = {
  Prefix.EMPTY: 'EMPTY',
  Prefix.MR: 'MR',
  Prefix.MISS: 'MISS',
};
