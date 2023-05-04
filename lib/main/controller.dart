import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/controller/telegram/telegram_controller.dart';
import '../common/getter/getter.dart';
import 'index.dart';

class AndroidMainPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AndroidMainPageController();
  final isProcessing = false.obs;
  final scrollController = ScrollController();
  RxInt indexOfBottomNavBar = 0.obs;
  RxInt currentTabIndex = 0.obs;

  final state = AndroidMainPageState();
  var searchInputController = TextEditingController();
  final tg = Get.put(TelegramController());
  void getContent() {
    telegramGetters.loadChats();
    telegramGetters.getChatHistory(-1001785447632, 0, 0, 10000, false);
  }

  @override
  void onInit() {
    getContent();
    super.onInit();
  }
}
