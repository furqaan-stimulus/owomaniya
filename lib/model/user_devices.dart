import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/device_os.dart';
import 'package:owomaniya/Enums/device_type.dart';

part 'user_devices.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class UserDevices {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "device_type")
  DeviceType deviceType;
  @JsonKey(name: "device_os")
  DeviceOs deviceOs;
  @JsonKey(name: "device_manufacturer")
  String deviceManufacturer;
  @JsonKey(name: "device_token")
  String deviceToken;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  dynamic deletedAt;
  @JsonKey(name: "created_by")
  String createdBy;
  @JsonKey(name: "upted_at")
  String updatedBy;
  @JsonKey(name: "users_at")
  String usersId;

  UserDevices({
    this.id,
    this.deviceType,
    this.deviceOs,
    this.deviceManufacturer,
    this.deviceToken,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.usersId,
  });

  factory UserDevices.fromJson(Map<String, dynamic> json) => _$UserDevicesFromJson(json);

  Map<String, dynamic> toJson() => _$UserDevicesToJson(this);

// factory UserDevices.fromJson(Map<String, dynamic> map) {
//   return UserDevices(
//       id: map['id'],
//       deviceType: map['device_type'],
//       deviceOs: map['device_os'],
//       deviceManufacturer: map['device_manufacturer'],
//       deviceToken: map['device_token'],
//       createdAt: map['created_at'],
//       createdBy: map['created_by'],
//       updatedAt: map['updated_at'],
//       updatedBy: map['updated_by'],
//       deletedAt: map['deleted_at'],
//       usersId: map['user_id']);
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['device_type'] = this.deviceType;
//   data['device_os'] = this.deviceOs;
//   data['device_manufacturer'] = this.deviceManufacturer;
//   data['device_token'] = this.deviceToken;
//   data['created_at'] = this.createdAt;
//   data['created_by'] = this.createdBy;
//   data['updated_at'] = this.updatedAt;
//   data['updated_by'] = this.updatedBy;
//   data['deleted_at'] = this.deletedAt;
//   data['users_id'] = this.usersId;
//   return data;
// }
}
