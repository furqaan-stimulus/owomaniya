import 'package:owomaniya/Enums/device_os.dart';
import 'package:owomaniya/Enums/device_type.dart';

class UserDevices {
  int id;
  DeviceType deviceType;
  DeviceOs deviceOs;
  String deviceManufacturer;
  String deviceToken;
  String createdAt;
  String createdBy;
  String updatedAt;
  String updatedBy;
  String deletedAt;
  String usersId;

  UserDevices(
      {this.id,
      this.deviceType,
      this.deviceOs,
      this.deviceManufacturer,
      this.deviceToken,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.deletedAt,
      this.usersId,});

  factory UserDevices.fromJson(Map<String, dynamic> map) {
    return UserDevices(
        id: map['id'],
        deviceType: map['device_type'],
        deviceOs: map['device_os'],
        deviceManufacturer: map['device_manufacturer'],
        deviceToken: map['device_token'],
        createdAt: map['created_at'],
        createdBy: map['created_by'],
        updatedAt: map['updated_at'],
        updatedBy: map['updated_by'],
        deletedAt: map['deleted_at'],
        usersId: map['user_id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['device_type'] = this.deviceType;
    data['device_os'] = this.deviceOs;
    data['device_manufacturer'] = this.deviceManufacturer;
    data['device_token'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    data['users_id'] = this.usersId;
    return data;
  }
}
