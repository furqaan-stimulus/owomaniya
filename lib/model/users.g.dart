// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map json) {
  return Users(
    id: json['id'] as int,
    emailAddress: json['email_address'] as String,
    mobileNo: json['mobile_no'] as String,
    gender: _$enumDecodeNullable(_$GenderEnumMap, json['gender']),
    password: json['password'] as String,
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
    healthDetails: json['health_details'] as String,
    rememberToken: json['remember_token'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    createdBy: json['created_by'] as String,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    updatedBy: json['updated_by'] as String,
    deletedAt: json['deleted_At'] == null
        ? null
        : DateTime.parse(json['deleted_At'] as String),
    userDevicesId: json['user_devices_id'] == null
        ? null
        : UserDevices.fromJson((json['user_devices_id'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    pgAmount: json['pg_amount'] as String,
    flagged: json['flagged'] as String,
    flagNote: json['flag_note'] as String,
    reasonForSuspension: _$enumDecodeNullable(
        _$ReasonOfSuspensionEnumMap, json['reason_for_suspension']),
    userUrl: json['user_url'] as String,
    uploadUrl: json['upload_url'] as String,
    verifiedEmail: json['verified_email'] as String,
    verifiedMobile: json['verified_mobile'] as String,
    authorDetails: (json['authordetails'] as List)
        ?.map((e) => e == null
            ? null
            : AuthorDetails.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    userStatus: json['user_status'] as String,
  );
}

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'email_address': instance.emailAddress,
      'mobile_no': instance.mobileNo,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'gender': _$GenderEnumMap[instance.gender],
      'marital_status': instance.maritalStatus,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'user_image': instance.userImage,
      'health_details': instance.healthDetails,
      'user_status': instance.userStatus,
      'password': instance.password,
      'remember_token': instance.rememberToken,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'deleted_At': instance.deletedAt?.toIso8601String(),
      'user_devices_id': instance.userDevicesId?.toJson(),
      'pg_amount': instance.pgAmount,
      'reason_for_suspension':
          _$ReasonOfSuspensionEnumMap[instance.reasonForSuspension],
      'flagged': instance.flagged,
      'flag_note': instance.flagNote,
      'user_url': instance.userUrl,
      'upload_url': instance.uploadUrl,
      'verified_mobile': instance.verifiedMobile,
      'verified_email': instance.verifiedEmail,
      'authordetails':
          instance.authorDetails?.map((e) => e?.toJson())?.toList(),
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

const _$GenderEnumMap = {
  Gender.M: 'M',
  Gender.F: 'F',
  Gender.NA: 'NA',
  Gender.O: 'O',
};

const _$ReasonOfSuspensionEnumMap = {
  ReasonOfSuspension.Misbehaviour: 'Misbehaviour',
  ReasonOfSuspension.poachingOfPatients: 'poachingOfPatients',
  ReasonOfSuspension.IncompleteAnswers: 'IncompleteAnswers',
  ReasonOfSuspension.UnprofessionalResponse: 'UnprofessionalResponse',
  ReasonOfSuspension.InactivityEvenAfterMultiple: 'InactivityEvenAfterMultiple',
};
