// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_devices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDevices _$UserDevicesFromJson(Map json) {
  return UserDevices(
    id: json['id'] as int,
    deviceType: _$enumDecodeNullable(_$DeviceTypeEnumMap, json['device_type']),
    deviceOs: _$enumDecodeNullable(_$DeviceOsEnumMap, json['device_os']),
    deviceManufacturer: json['device_manufacturer'] as String,
    deviceToken: json['device_token'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    createdBy: json['created_by'] as String,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    updatedBy: json['upted_at'] as String,
    deletedAt: json['deleted_at'],
    usersId: json['users_at'] as String,
  );
}

Map<String, dynamic> _$UserDevicesToJson(UserDevices instance) =>
    <String, dynamic>{
      'id': instance.id,
      'device_type': _$DeviceTypeEnumMap[instance.deviceType],
      'device_os': _$DeviceOsEnumMap[instance.deviceOs],
      'device_manufacturer': instance.deviceManufacturer,
      'device_token': instance.deviceToken,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'created_by': instance.createdBy,
      'upted_at': instance.updatedBy,
      'users_at': instance.usersId,
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

const _$DeviceTypeEnumMap = {
  DeviceType.desktop: 'desktop',
  DeviceType.tab: 'tab',
  DeviceType.mobile: 'mobile',
};

const _$DeviceOsEnumMap = {
  DeviceOs.windows: 'windows',
  DeviceOs.android: 'android',
  DeviceOs.ios: 'ios',
  DeviceOs.linux: 'linux',
};
