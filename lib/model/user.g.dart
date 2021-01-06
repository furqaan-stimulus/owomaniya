// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map json) {
  return User(
    id: json['id'] as int,
    emailAddress: json['email_address'] as String,
    mobileNo: json['mobile_no'] as String,
    gender: json['gender'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    dateOfBirth: json['date_of_birth'] == null
        ? null
        : DateTime.parse(json['date_of_birth'] as String),
    maritalStatus: json['marital_status'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    country: json['country'] as String,
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
    userDevicesId: json['user_devices_id'] as int,
    pgAmount: json['pg_amount'] as int,
    flagged: json['flagged'] as String,
    flagNote: json['flag_note'],
    reasonForSuspension: _$enumDecodeNullable(
        _$ReasonOfSuspensionEnumMap, json['reason_for_suspension']),
    userUrl: json['user_url'] as String,
    uploadUrl: json['upload_url'] as String,
    verifiedEmail: json['verified_email'] as int,
    verifiedMobile: json['verified_mobile'] as int,
    expertexpertisemapping: (json['expertexpertisemapping'] as List)
        ?.map((e) => e == null
            ? null
            : ExpertExpertiseMapping.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    authorDetails: (json['authordetails'] as List)
        ?.map((e) => e == null
            ? null
            : UserAuthorDetail.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    queryPrice: json['query_price'] as String,
    expertDetails: json['expertdetails'] == null
        ? null
        : ExpertDetail.fromJson((json['expertdetails'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    alternativeImage: json['alternativeimage'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'email_address': instance.emailAddress,
      'last_name': instance.lastName,
      'mobile_no': instance.mobileNo,
      'user_image': instance.userImage,
      'upload_url': instance.uploadUrl,
      'authordetails':
          instance.authorDetails?.map((e) => e?.toJson())?.toList(),
      'query_price': instance.queryPrice,
      'expertexpertisemapping':
          instance.expertexpertisemapping?.map((e) => e?.toJson())?.toList(),
      'expertdetails': instance.expertDetails?.toJson(),
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
      'marital_status': instance.maritalStatus,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'health_details': instance.healthDetails?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'user_devices_id': instance.userDevicesId,
      'pg_amount': instance.pgAmount,
      'reason_for_suspension':
          _$ReasonOfSuspensionEnumMap[instance.reasonForSuspension],
      'flagged': instance.flagged,
      'flag_note': instance.flagNote,
      'user_url': instance.userUrl,
      'verified_mobile': instance.verifiedMobile,
      'verified_email': instance.verifiedEmail,
      'alternativeimage': instance.alternativeImage,
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
