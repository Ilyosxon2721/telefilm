import 'package:get/get.dart';
import 'package:telegram_client/telegram_client.dart';

import 'config/telegram/tdlib_config/config.dart';

class GlobalConnectClass extends GetxController {
  final config = Get.put(TdlibConfig());

  late Tdlib tg = Tdlib(clientOption: config.clientOption);
}
