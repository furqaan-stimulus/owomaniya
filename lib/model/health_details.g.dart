// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthDetails _$HealthDetailsFromJson(Map json) {
  return HealthDetails(
    height: json['height'] as int,
    weight: json['weight'] as int,
    heightUnit: json['heightUnit'] as String,
    weightUnit: json['weightunit'] as String,
    bloodGroup: json['bloodGroup'] as String,
    bmi: json['bmi'] as int,
  );
}

Map<String, dynamic> _$HealthDetailsToJson(HealthDetails instance) =>
    <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'heightUnit': instance.heightUnit,
      'weightunit': instance.weightUnit,
      'bloodGroup': instance.bloodGroup,
      'bmi': instance.bmi,
    };
