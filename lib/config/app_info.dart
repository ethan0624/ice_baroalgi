import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static String? _appVersion;
  static String? _packageName;
  static String? _userAgent;
  static String? _deviceId;
  static String? _deviceModel;
  static String? _deviceOs;
  static String? _deviceOsVersion;
  static String? _deviceManufacturer;

  String get appVersion => _appVersion ?? 'unknown app version';
  String get packageName => _packageName ?? 'unknown package name';
  String get userAgent => _userAgent ?? '';
  String get deviceId => _deviceId ?? '';
  String get deviceModel => _deviceModel ?? '';
  String get deviceOs => _deviceOs ?? '';
  String get deviceOsVersion => _deviceOsVersion ?? '';
  String get deviceManufacturer => _deviceManufacturer ?? '';

  static initialize() async {
    final packageInfo = await PackageInfo.fromPlatform();
    _packageName = packageInfo.packageName;
    _appVersion = packageInfo.version;

    final deviceInfo = DeviceInfoPlugin();
    final appInfo = 'incheonKnowhowApp/$_appVersion';

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      _deviceId = androidInfo.id;
      _deviceModel = androidInfo.model;
      _deviceOs = 'android';
      _deviceOsVersion = androidInfo.version.release;
      _deviceManufacturer = androidInfo.manufacturer;
      _userAgent =
          '$appInfo $_deviceModel android/$_deviceOsVersion(${androidInfo.version.sdkInt})';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      _deviceId = iosInfo.identifierForVendor;
      _deviceModel = iosInfo.model;
      _deviceOs = iosInfo.systemName;
      _deviceOsVersion = iosInfo.systemVersion;
      _deviceManufacturer = 'apple';
      _userAgent = '$appInfo $_deviceModel ios/$_deviceOsVersion';
    } else {
      _userAgent = '$appInfo (Unknown)';
    }
  }
}
