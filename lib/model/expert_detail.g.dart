// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertDetail _$ExpertDetailFromJson(Map json) {
  return ExpertDetail(
    id: json['id'] as int,
    userExpertExp: json['user_expert_exp'] as int,
  );
}

Map<String, dynamic> _$ExpertDetailToJson(ExpertDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_expert_exp': instance.userExpertExp,
    };
