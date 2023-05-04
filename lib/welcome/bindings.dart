import 'package:get/get.dart';

import 'controller.dart';

class AndroidWelcomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AndroidWelcomePageController>(
        () => AndroidWelcomePageController());
  }
}
