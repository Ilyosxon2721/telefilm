import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../common/controller/telegram/telegram_controller.dart';
import 'index.dart';

class AndroidVerifyPhoneNumberPageController extends GetxController {
  AndroidVerifyPhoneNumberPageController();
  final state = AndroidVerifyPhoneNumberPageState();
  var pinPutController = TextEditingController();
  final tg = Get.put(TelegramController());
  @override
  void onInit() {
    super.onInit();
  }
}
