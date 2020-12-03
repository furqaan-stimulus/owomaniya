// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsModel _$TermsModelFromJson(Map<String, dynamic> json) {
  return TermsModel(
    status: json['status'] as bool,
    data: json['data'] as String,
  );
}

Map<String, dynamic> _$TermsModelToJson(TermsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
