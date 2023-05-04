import 'package:get/get.dart';

import '../common/controller/telegram/telegram_controller.dart';
import 'index.dart';

class AndroidWelcomePageController extends GetxController {
  AndroidWelcomePageController();
  final state = AndroidWelcomePageState();
  final tg = Get.put(TelegramController());
  @override
  void onInit() {
    print(tg.tg);
    super.onInit();
  }
}
