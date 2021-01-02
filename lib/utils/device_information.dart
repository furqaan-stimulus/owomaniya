import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class DeviceInformation {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData;

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    print(deviceData);
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'device': build.device,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'type': build.type,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'model': data.model,
    };
  }
}
