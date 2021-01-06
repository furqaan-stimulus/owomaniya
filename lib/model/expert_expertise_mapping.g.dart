// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_expertise_mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertExpertiseMapping _$ExpertExpertiseMappingFromJson(Map json) {
  return ExpertExpertiseMapping(
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    parentExpertise: json['parentexpertise'] == null
        ? null
        : ParentExpertise.fromJson((json['parentexpertise'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$ExpertExpertiseMappingToJson(
        ExpertExpertiseMapping instance) =>
    <String, dynamic>{
      'updated_at': instance.updatedAt?.toIso8601String(),
      'parentexpertise': instance.parentExpertise?.toJson(),
    };
