import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../utils/firebase_notifications_handler.dart';

@lazySingleton
class DeviceInfoHelper {
  DeviceInfoHelper()
    : _deviceInfoPlugin = DeviceInfoPlugin(),
      _notificationsHandler = FirebaseNotificationsHandler();

  DeviceInfoHelper.withDependencies({
    DeviceInfoPlugin? deviceInfoPlugin,
    FirebaseNotificationsHandler? notificationsHandler,
  }) : _deviceInfoPlugin = deviceInfoPlugin ?? DeviceInfoPlugin(),
       _notificationsHandler =
           notificationsHandler ?? FirebaseNotificationsHandler();

  final DeviceInfoPlugin _deviceInfoPlugin;
  final FirebaseNotificationsHandler _notificationsHandler;

  Future<Map<String, dynamic>> getDeviceData() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final pushToken = await _getPushToken();

    final deviceData = <String, dynamic>{
      'deviceId': await _getDeviceId(),
      'platform': Platform.operatingSystem,
      'appVersion': packageInfo.version,
      if ((pushToken ?? '').isNotEmpty) 'pushToken': pushToken,
    };

    return deviceData;
  }

  Future<String> _getDeviceId() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      return androidInfo.id;
    }

    if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      return iosInfo.identifierForVendor ?? '';
    }

    final deviceInfo = await _deviceInfoPlugin.deviceInfo;
    return deviceInfo.data['id']?.toString() ?? '';
  }

  Future<String?> _getPushToken() async {
    try {
      return _notificationsHandler.cachedFcmToken ??
          await _notificationsHandler.refreshFcmToken();
    } catch (_) {
      return null;
    }
  }
}
