import 'package:get/get.dart';

import 'controller.dart';

class AndroidChatsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AndroidChatsPageController>(() => AndroidChatsPageController());
  }
}
