import 'package:get/get.dart';

import 'controller.dart';

class AndroidProfilePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AndroidProfilePageController>(
        () => AndroidProfilePageController());
  }
}
