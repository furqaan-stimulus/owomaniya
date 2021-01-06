// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_expert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedExpert _$AssignedExpertFromJson(Map json) {
  return AssignedExpert(
    id: json['id'] as int,
    emailAddress: json['email_address'] as String,
    mobileNo: json['mobile_no'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    dateOfBirth: json['date_of_birth'] == null
        ? null
        : DateTime.parse(json['date_of_birth'] as String),
    gender: json['gender'] as String,
    maritalStatus: json['marital_status'] as String,
    city: json['city'] as String,
    state: json['state'],
    country: json['country'],
    userImage: json['user_image'] as String,
    healthDetails: json['health_details'] == null
        ? null
        : HealthDetails.fromJson((json['health_details'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    deletedAt: json['deleted_at'],
    userDevicesId: json['user_device_id'] as int,
    pgAmount: json['pg_amount'] as int,
    reasonForSuspension: _$enumDecodeNullable(
        _$ReasonOfSuspensionEnumMap, json['reason_for_suspension']),
    flagged: json['flagged'] as String,
    flagNote: json['flag_note'],
    userUrl: json['user_url'] as String,
    uploadUrl: json['upload_url'] as String,
    verifiedMobile: json['verified_mobile'] as int,
    verifiedEmail: json['verified_email'] as int,
  );
}

Map<String, dynamic> _$AssignedExpertToJson(AssignedExpert instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email_address': instance.emailAddress,
      'mobile_no': instance.mobileNo,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
      'marital_status': instance.maritalStatus,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'user_image': instance.userImage,
      'health_details': instance.healthDetails?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'user_device_id': instance.userDevicesId,
      'pg_amount': instance.pgAmount,
      'reason_for_suspension':
          _$ReasonOfSuspensionEnumMap[instance.reasonForSuspension],
      'flagged': instance.flagged,
      'flag_note': instance.flagNote,
      'user_url': instance.userUrl,
      'upload_url': instance.uploadUrl,
      'verified_mobile': instance.verifiedMobile,
      'verified_email': instance.verifiedEmail,
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

const _$ReasonOfSuspensionEnumMap = {
  ReasonOfSuspension.Misbehaviour: 'Misbehaviour',
  ReasonOfSuspension.poachingOfPatients: 'poachingOfPatients',
  ReasonOfSuspension.IncompleteAnswers: 'IncompleteAnswers',
  ReasonOfSuspension.UnprofessionalResponse: 'UnprofessionalResponse',
  ReasonOfSuspension.InactivityEvenAfterMultiple: 'InactivityEvenAfterMultiple',
};
