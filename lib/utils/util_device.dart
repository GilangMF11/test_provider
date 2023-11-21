import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';


Future<String> getDeviceId() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.data['androidId']; // Gunakan properti yang sesuai dengan kebutuhan Anda
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.data['identifierForVendor']; // Gunakan properti yang sesuai dengan kebutuhan Anda
  }
  return ''; // Default value jika tidak ditemukan di platform lain
}
