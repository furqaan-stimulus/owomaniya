// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacyModel _$PrivacyModelFromJson(Map<String, dynamic> json) {
  return PrivacyModel(
    status: json['status'] as bool,
    data: json['data'] as String,
  );
}

Map<String, dynamic> _$PrivacyModelToJson(PrivacyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
