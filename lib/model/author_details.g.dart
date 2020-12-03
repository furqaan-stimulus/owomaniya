// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorDetails _$AuthorDetailsFromJson(Map json) {
  return AuthorDetails(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    user: json['user'] == null
        ? null
        : Users.fromJson((json['user'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    userRoleId: json['user_role_id'] as int,
    introduction: json['introduction'] as String,
    brief: json['brief'] as String,
    facebookLink: json['facebook_link'] as String,
    twitterLink: json['twitter_link'] as String,
    website: json['website'] as String,
    prefix: json['prefix'] as String,
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
    roles: json['roles'] == null
        ? null
        : Roles.fromJson((json['roles'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$AuthorDetailsToJson(AuthorDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user_role_id': instance.userRoleId,
      'introduction': instance.introduction,
      'brief': instance.brief,
      'facebook_link': instance.facebookLink,
      'twitter_link': instance.twitterLink,
      'website': instance.website,
      'prefix': instance.prefix,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'user': instance.user?.toJson(),
      'roles': instance.roles?.toJson(),
    };
