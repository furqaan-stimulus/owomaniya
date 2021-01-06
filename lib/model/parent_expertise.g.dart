// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_expertise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentExpertise _$ParentExpertiseFromJson(Map json) {
  return ParentExpertise(
    id: json['id'] as int,
    expertiseId: json['expertise_id'],
    expertiseName: json['expertise_name'] as String,
    iconPath: json['icon_path'],
    updatedAt: json['updated_at'],
  );
}

Map<String, dynamic> _$ParentExpertiseToJson(ParentExpertise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expertise_id': instance.expertiseId,
      'expertise_name': instance.expertiseName,
      'icon_path': instance.iconPath,
      'updated_at': instance.updatedAt,
    };
