// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_query_assigned.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedQueryAssigned _$FeedQueryAssignedFromJson(Map json) {
  return FeedQueryAssigned(
    id: json['id'] as int,
    feedsId: json['feeds_id'] as int,
    assignedUserExpertId: json['assigned_user_expert_id'] as int,
    feedStatus: json['feed_status'] as String,
    initialUserExpertId: json['intial_user_expert_id'],
    totalFollowUps: json['totalfollowups'] as int,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    createdBy: json['created_by'] as int,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    latestAnswer: json['latestanswer'],
    assignedExpert: json['assignedexpert'] == null
        ? null
        : AssignedExpert.fromJson((json['assignedexpert'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$FeedQueryAssignedToJson(FeedQueryAssigned instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feeds_id': instance.feedsId,
      'assigned_user_expert_id': instance.assignedUserExpertId,
      'feed_status': instance.feedStatus,
      'intial_user_expert_id': instance.initialUserExpertId,
      'totalfollowups': instance.totalFollowUps,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'latestanswer': instance.latestAnswer,
      'assignedexpert': instance.assignedExpert?.toJson(),
    };
