import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TdlibConfig extends GetxController {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  RxString dbPath = '/data/user/0/app.telefilm.org.telefilm/'.obs;
  RxString filePath = '/data/user/0/app.telefilm.org.telefilm/'.obs;
  dynamic info;
  void setDeviceInfo() async {
    info = await deviceInfo.androidInfo;
    update();
  }

  Future<void> setPath() async {
    if (Platform.isAndroid) {
      if (await Permission.storage.request().isGranted) {
        Directory database = await getApplicationSupportDirectory();
        Directory file = await getApplicationDocumentsDirectory();
        dbPath.value = database.path;
        filePath.value = file.path;
        print("Path ${dbPath.value}");
      } else {
        Permission.storage.request();
      }
    }
  }

  @override
  void onInit() {
    setPath();
    setDeviceInfo();
    getTdlib();
    super.onInit();
  }

  static int apiId = 20672376;
  static String apiHashCode = "4adb8bd4f6fc2f1f8f27db116fc518e5";
  late Map clientOption = {
    "use_test_dc": false,
    "use_file_database": true,
    "use_chat_info_database": true,
    "use_message_database": true,
    "use_secret_chats": false,
    'enable_storage_optimizer': true,
    'application_version': '1.0.0',
    'device_model': 'TeleFilm',
    "api_id": apiId,
    "api_hash": apiHashCode,
    "database_directory": "$dbPath/tg_db/",
    'files_directory': "$filePath/files/",
    'system_language_code': 'en',
  };
}

String getTdlib() {
  if (Platform.isWindows) {
    return "libtdjson.dll";
  } else if (Platform.isMacOS || Platform.isIOS) {
    return "libtdjson.dyll";
  }
  return "libtdjson.so";
}
